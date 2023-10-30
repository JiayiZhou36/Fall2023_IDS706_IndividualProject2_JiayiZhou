## Fall2023_IDS706 Individual Project 2: Rust CLI Binary with SQLite
### by Jiayi Zhou [![Rust CI/CD Pipeline](https://github.com/nogibjj/Fall2023_IDS706_IndividualProject2_JiayiZhou/actions/workflows/ci.yml/badge.svg)](https://github.com/nogibjj/Fall2023_IDS706_IndividualProject2_JiayiZhou/actions/workflows/ci.yml)
### Purpose
This is for class data engineering individual project 2: Rust CLI Binary with SQLite. It uses Rust Script interacting with SQL Database with SQLite. It utilizes continuous integration using GitHub Actions to automatically set up environment, test, format and lint code. It also uses an AI Assistant--Copilot to assit the process.

### Video
[YouTube](https://youtu.be/jDlCHruUbJw)

### Functionality
The code does: ETL-Query: [E] Extract a dataset from URL, [T] Transform, [L] Load into SQLite Database and [Q] Query For the ETL-Query lab:
  * [E] Extract a dataset from a URL with CSV format.
  * [T] Transform the data by cleaning, filtering, enriching, etc to get it ready for analysis.
  * [L] Load the transformed data into a SQLite database table using Python's sqlite3 module with create and update operations.
  * [Q] Accept and execute general SQL queries including in CRUD (Create, Read, Update, Delete) operations on the SQLite database to analyze and retrieve insights from the data.

### Steps
I created the template based on the template created by Professor Noah Gift and modified the template. Based on the template from professor, I made the following changes with GitHub Copilot helping me in syntax of Rust:
1. Cargo init to add rust constructions
2. Change the dataset from food market to goose. Goose is from FiveThirtyEight's public dataset. It is extracted into a local csv file, tranfromed the csv file with cleaning, and loaded into a .db file, and queryed with SQLlite.
3. Convert the main.py into a command-line tool
4. Update funcitonalities to extract, transform, load (create and insert), and general queries including in CRUD (Create, Read, Update, Delete) operations on the data
5. Create a sql log to record all the actions performed in the query
6. Create an architectural diagram showing how the project works

### Components:

1. **Data Extraction:**
   - The `extract` function downloads data from a specified URL and saves it to a local file.

2. **Data Transformation and Loading:**
   - The `transform_load` function reads a CSV dataset and inserts its records into a SQLite database after performing necessary table operations. It creates a table named `ServeTimesDB` with specific columns.

3. **Database Querying:**
   - The `query` function allows users to perform SELECT, INSERT, UPDATE, and DELETE operations on the database. It logs the queries into a Markdown file named `query_log.md`.

4. **Logging:**
   - The `log_query` function appends SQL queries to a log file, facilitating tracking and analysis of executed queries.

### Preparation and Dependency Installation: 
1. open codespaces 
2. wait for codespaces to be built 
3. build: `cargo build` for dependencies installation
4. extract: `cargo run extract`
5. transform and load: `cargo run transform_load`
6. query sample: you can use `make create`, `make read`, `make update`, or `make delete` to see sample CRUD Operations
7. query your own: `cargo run query <insert own query here>`
8. You can find my successful CRUD operations [here](https://github.com/nogibjj/Fall2023_IDS706_IndividualProject2_JiayiZhou/blob/main/query_log.md)

### Check Format and Test Errors: 
1. Format code `make format`
2. Lint code `make lint`
3. Test coce `make test`

### Optimized Rust Binary
1. You can find and download the uploaded artifact by going to `actions` and clicking on the latest workflow run

### Dataset
The dataset is loaded in based on url.  Here is the url: [(https://raw.githubusercontent.com/fivethirtyeight/data/master/goose/goose_rawdata.csv)](https://raw.githubusercontent.com/fivethirtyeight/data/master/goose/goose_rawdata.csv). The file is a comma-separated value spreadsheet (CSV) called goose_rawdata.csv.  
<img width="497" alt="Screenshot 2023-09-12 at 10 19 05 PM" src="https://github.com/nogibjj/Fall2023_IDS706_MiniProject3_JiayiZhou/assets/143651921/ca45cc76-2d2e-4d26-a2b5-6bff9dcaf0ee">

### Visualization of Process:
![process (3)](https://github.com/nogibjj/Fall2023_IDS706_MiniProject5_JiayiZhou/assets/143651921/f0480b87-bc09-49f4-9d9a-4f483343284c)
