-- Module 02: DML - INSERT INTO (Inserting Literal Values)
CREATE SCHEMA IF NOT EXISTS demo.bakehouse;

-- 1. Prepare target table
CREATE
OR REPLACE TABLE demo.bakehouse.franchise_branches (
    franchiseID BIGINT,
    name STRING,
    city STRING,
    country STRING,
    size STRING
);

-- 2. Insert single and multiple literal rows
INSERT INTO
    demo.bakehouse.franchise_branches
VALUES
    (
        9001,
        'Bakehouse Silom',
        'Bangkok',
        'Thailand',
        'Large'
    ),
    (
        9002,
        'Bakehouse Sukhumvit',
        'Bangkok',
        'Thailand',
        'Medium'
    );

-- 3. Verify inserted rows
SELECT
    *
FROM
    demo.bakehouse.franchise_branches;

-- 4. Drop temporary table cleanup
DROP TABLE IF EXISTS demo.bakehouse.franchise_branches;