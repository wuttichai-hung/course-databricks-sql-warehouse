# Module 01: พื้นฐาน Databricks สำหรับ SQL Warehouse

โมดูลนี้ปูพื้นฐานให้ผู้เริ่มต้นเข้าใจแนวคิดของ Databricks Lakehouse และวิธีใช้งาน SQL Warehouse ก่อนเริ่มเขียน SQL จริงในโมดูลถัดไป

---

## 🚀 การเริ่มต้นใช้งาน Databricks (Account & Workspace Setup)

1. **สมัคร/เข้าสู่ระบบ Databricks Account:**
   - ลงทะเบียนใช้งานได้ที่ [https://www.databricks.com/learn/free-edition](https://www.databricks.com/learn/free-edition)
2. **สร้าง Workspace (Serverless):**
   - **Workspace Name:** `Demo`
   - **Region:** `Singapore`
   - **Storage and compute:** `Serverless`
3. **เปิดใช้งาน Workspace:**
   - กดคลิกเปิด Workspace ที่สร้างไว้เพื่อเข้าสู่ Databricks Console
4. **เปิด SQL Editor และรัน Query แรก:**
   - ไปที่เมนู **SQL Editor** > **New SQL Query**
   - พิมพ์คำสั่ง SQL ทดสอบ:
     ```sql
     SELECT * FROM samples.bakehouse.sales_customers;
     ```
   - กด **Run** (หรือใช้คีย์ลัด `Cmd/Ctrl + Enter`) เพื่อดูผลลัพธ์

---

## 1. Lakehouse Concept

**Lakehouse คืออะไร**

Lakehouse คือสถาปัตยกรรมที่รวมข้อดีของ **Data Warehouse** (มีโครงสร้าง, รองรับ SQL, ธุรกรรมที่เชื่อถือได้) เข้ากับ **Data Lake** (เก็บข้อมูลได้ทุกรูปแบบ ราคาถูก ขยายขนาดง่าย) ไว้ในระบบเดียว

**แตกต่างจาก RDBMS ดั้งเดิม (PostgreSQL, SQL Server) อย่างไร**

| หัวข้อ | RDBMS ดั้งเดิม | Databricks Lakehouse |
| --- | --- | --- |
| Compute กับ Storage | ผูกติดกันในเครื่องเดียวหรือคลัสเตอร์เดียว | แยกออกจากกัน (Compute แยกกับ Storage) สามารถปิด Compute เพื่อประหยัดต้นทุนโดยที่ข้อมูลยังอยู่ |
| รูปแบบการเก็บข้อมูล | ตารางในรูปแบบเฉพาะของฐานข้อมูล (Proprietary) | ข้อมูลเก็บเป็นไฟล์ **Delta Lake** (Parquet + Transaction Log) บน Object Storage เช่น S3, ADLS |
| การขยายขนาด | ขยายยาก ต้อง Scale-up เครื่อง | ขยายได้ง่ายทั้ง Storage และ Compute แยกอิสระจากกัน (Scale-out) |
| ชนิดข้อมูลที่รองรับ | ส่วนใหญ่เป็นข้อมูลมีโครงสร้าง | รองรับทั้งข้อมูลมีโครงสร้าง กึ่งโครงสร้าง และไม่มีโครงสร้าง |
| ความน่าเชื่อถือของข้อมูล | มี ACID Transaction ในตัว | Delta Lake เพิ่มความสามารถ ACID Transaction ให้กับ Data Lake |

**ทำไมการแยก Compute กับ Storage ถึงสำคัญ**

- จ่ายค่า Storage (พื้นที่เก็บข้อมูล) ในราคาที่ถูกกว่ามากเมื่อเทียบกับการเก็บในฐานข้อมูลทั่วไป
- สามารถเปิด/ปิด หรือปรับขนาด Compute (เช่น SQL Warehouse) ตามการใช้งานจริง โดยข้อมูลใน Storage ไม่หายไปไหน
- หลาย ๆ Compute (SQL Warehouse, Cluster สำหรับ Python/Spark) สามารถเข้าถึงข้อมูลชุดเดียวกันได้พร้อมกัน

---

## 2. 3-Level Namespace (Unity Catalog)

Unity Catalog คือระบบจัดการ Metadata และสิทธิ์การเข้าถึงข้อมูลของ Databricks ที่ทำให้การอ้างอิงตารางเป็นแบบ 3 ระดับ (3-Level Namespace):

```text
catalog.schema.table
```

- **catalog**: ระดับบนสุด ใช้แบ่งกลุ่มข้อมูลตามองค์กร ทีม หรือสภาพแวดล้อม (เช่น `prod`, `dev`, `samples`)
- **schema**: เทียบเท่ากับ database ในระบบดั้งเดิม ใช้จัดกลุ่มตารางที่เกี่ยวข้องกัน (เช่น `bakehouse`)
- **table**: ตารางข้อมูลจริงที่เก็บแถวและคอลัมน์

ตัวอย่างการอ้างอิงตาราง:

```sql
SELECT *
FROM samples.bakehouse.sales_customers;
```

จากตัวอย่างข้างต้น:
- `samples` คือ catalog
- `bakehouse` คือ schema
- `sales_customers` คือ table

การอ้างอิงแบบ 3-Level Namespace นี้ช่วยให้:
- แยกสิทธิ์การเข้าถึงข้อมูลได้ละเอียดในแต่ละระดับ (catalog / schema / table)
- ค้นหาและจัดระเบียบข้อมูลได้ง่ายขึ้นเมื่อมีหลายทีมใช้งานร่วมกัน
- หลีกเลี่ยงชื่อตารางชนกันระหว่างโปรเจกต์หรือทีมต่าง ๆ

---

## 3. SQL Warehouse เบื้องต้น

SQL Warehouse คือ Compute ที่ใช้สำหรับรัน Query SQL บน Databricks โดยเฉพาะ

**ชนิดของ Warehouse**

| ชนิด | รายละเอียด |
| --- | --- |
| **Serverless** | Databricks จัดการ Infrastructure ให้ทั้งหมด เริ่มทำงานได้เร็วมาก (วินาที) เหมาะกับผู้เริ่มต้นและงานที่ต้องการความรวดเร็วในการเปิดใช้ |
| **Pro** | รันบน Cloud Account ของผู้ใช้เอง เปิดใช้ Feature ขั้นสูงบางอย่างได้ เช่น Predictive I/O ใช้เวลาเริ่มทำงานนานกว่า Serverless |
| **Classic** | ตัวเลือกพื้นฐานที่สุด ต้นทุนต่ำ แต่ Feature จำกัดกว่า Pro |

**การ Start/Stop**

- Warehouse ต้องอยู่ในสถานะ **Running** ก่อนจึงจะรัน Query ได้
- สามารถกด **Start** เพื่อเปิดใช้งาน และ **Stop** เพื่อหยุดการทำงานได้ด้วยตนเองจากหน้า SQL Warehouses
- ระหว่างที่ Warehouse หยุดทำงาน จะไม่มีการคิดค่าใช้จ่ายด้าน Compute (ข้อมูลใน Storage ยังคงอยู่เหมือนเดิม)

**Auto-stop เพื่อประหยัดต้นทุน**

- ตั้งค่า **Auto Stop** ได้ เพื่อให้ Warehouse หยุดทำงานอัตโนมัติเมื่อไม่มีการใช้งานตามระยะเวลาที่กำหนด (เช่น 10 นาที)
- ช่วยลดค่าใช้จ่ายโดยไม่ต้องคอยปิด Warehouse ด้วยตนเองทุกครั้ง
- ควรตั้งค่า Auto-stop ให้เหมาะสมกับพฤติกรรมการใช้งานจริง เช่น ตั้งเวลาสั้นสำหรับ Warehouse ที่ใช้ทดสอบหรือเรียนรู้

---

## 4. UI Walkthrough

**SQL Editor**

- พื้นที่หลักสำหรับเขียนและรัน SQL Query
- เลือก Warehouse ที่ต้องการใช้งานได้จากมุมขวาบนของหน้าจอ
- แสดงผลลัพธ์ Query เป็นตารางด้านล่าง พร้อมสามารถ Export หรือสร้างกราฟจากผลลัพธ์ได้

**History tab**

- เก็บประวัติ Query ที่เคยรันไปแล้วทั้งหมด พร้อมสถานะ (สำเร็จ/ล้มเหลว), เวลาที่ใช้ และ Warehouse ที่ใช้รัน
- ใช้ตรวจสอบย้อนกลับได้ว่า Query ก่อนหน้ารันผ่านหรือไม่ และใช้เวลานานเท่าไร
- กดเปิด Query เก่าจาก History เพื่อนำกลับมาแก้ไขหรือรันซ้ำได้ทันที

**การสร้าง Query เบื้องต้น**

1. ไปที่เมนู **SQL Editor**
2. เลือก SQL Warehouse ที่ต้องการใช้ (ตรวจสอบว่าอยู่ในสถานะ Running)
3. เขียน Query โดยอ้างอิงตารางแบบ 3-Level Namespace เช่น:

    ```sql
    SELECT *
    FROM samples.bakehouse.sales_customers
    LIMIT 10;
    ```

4. กด **Run** (หรือ `Cmd/Ctrl + Enter`) เพื่อรัน Query และดูผลลัพธ์ด้านล่าง

---

## สรุป

หลังจบโมดูลนี้ ผู้เรียนควรเข้าใจ:
- ขั้นตอนการสมัครและเตรียม Databricks Serverless Workspace (`Demo`, Region: `Singapore`)
- แนวคิด Lakehouse และความแตกต่างจาก RDBMS ดั้งเดิม
- การอ้างอิงตารางด้วย 3-Level Namespace ผ่าน Unity Catalog
- ชนิดของ SQL Warehouse และวิธีจัดการเพื่อควบคุมต้นทุน
- การใช้งาน SQL Editor และ History tab เบื้องต้น

โมดูลถัดไป ([module02_sql_fundamentals](../module02_sql_fundamentals/README.md)) จะเริ่มลงมือเขียน SQL Query จริงกับข้อมูลตัวอย่าง
