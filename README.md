Assignment: Database Queries and Analysis
Overview
This repository contains an assignment focused on querying and analyzing data stored in CSV files, which represent tables in a MySQL database. The dataset includes four CSV files, each corresponding to a different table in the database. The relationships between these tables are defined through foreign keys.

Data Description
The CSV files and their corresponding table relationships are as follows:

category.csv: Contains data for the category table.
brands.csv: Contains data for the brands table.
listingdata.csv: Contains data for the listingdata table.
category_id is a ForeignKey to the category table on the id column.
brand_id is a ForeignKey to the brands table on the id column.
listinghistory.csv: Contains data for the listinghistory table.
listing_id is a ForeignKey to the listingdata table on the id column.
Problems
The assignment requires writing MySQL queries to solve the following problems:

Identify Unique Categories Sold by a Specific Brand

Query: Write a MySQL query to identify all the unique categories sold by any specific brand name. (Assume the brand name is Rite Clique).
Calculate Average Selling Price by Category for a Specific Brand

Query: Write a MySQL query to find the average selling prices (selling_price) of each category sold by any specific brand name. (Assume the brand name is Rite Clique).
Calculate Average Promotion Value by Category for a Specific Brand in May

Query: Write a MySQL query to find the average promotion value for each category sold by any specific brand name in the month of May. (Assume the brand name is Rite Clique).
Solution Queries: SQL file is uploaded for solutions.
Instructions
Setup MySQL Database: Create the tables and import data from the CSV files into your MySQL database.
Run Queries: Use the provided MySQL queries to answer the questions outlined in the problems section.
Modify Queries: If necessary, adjust the queries to match the structure and data of your database.
Additional Information
Ensure that the relationships defined by foreign keys are correctly established in your database schema.
Verify that the date format in the promotion_history JSON column matches the expected format (%Y-%m-%d) for correct query execution.
The provided queries assume the use of MySQL functions and syntax. Adjustments may be needed if using a different SQL dialect.
