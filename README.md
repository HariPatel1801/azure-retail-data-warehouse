# Azure-Retail-Data-Warehouse
Built an end-to-end Azure Retail Data Warehouse using Medallion Architecture (Bronze, Silver, Gold). Implemented data ingestion, cleansing, validation, Parquet storage, Azure SQL integration, and SCD Type 1/2 processing using Azure Data Factory, Azure Data Lake Storage Gen2, and Azure SQL Database.

🔹 Built scalable ETL/ELT pipelines to ingest Customer, Product, and Sales datasets and process them through Bronze, Silver, and Gold layers.

🔹 Implemented data quality and validation checks including schema standardization, null handling, duplicate removal, email/phone validation, and referential integrity verification.

🔹 Designed dimensional models consisting of Customer and Product dimensions and a Sales fact table following data warehousing best practices.

🔹 Implemented SCD Type 1 for Customer dimensions and SCD Type 2 for Product dimensions using Azure Data Factory Mapping Data Flows.

🔹 Leveraged MD5 hash-based change detection to identify data changes efficiently, reducing the complexity of traditional column-by-column comparisons and improving scalability.

🔹 Developed an enterprise-grade analytics platform using Azure SQL Database, Parquet storage, surrogate keys, audit columns, and business-ready dimensional structures for reporting and decision-making.
