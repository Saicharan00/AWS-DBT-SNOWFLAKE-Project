# Airbnb Analytics Pipeline with dbt & Snowflake

## 📊 Project Overview

An end-to-end analytics pipeline that transforms raw Airbnb data from S3 into production-ready dimensional models using dbt and Snowflake. This project demonstrates modern data transformation practices, dimensional modeling, and analytics engineering principles used in production environments.

I designed this to replicate real-world analytics engineering workflows: secure cloud ingestion, modular transformations, dimensional modeling, and comprehensive data quality testing.

## 🏗️ Architecture

The pipeline follows the **medallion architecture** pattern with three distinct layers:

- **Bronze Layer**: Raw data ingestion from S3 with full auditability
- **Silver Layer**: Cleaned, deduplicated, and validated data
- **Gold Layer**: Business-ready dimensional models (star schema)

This separation provides clear data quality boundaries and makes debugging significantly easier while following modern data engineering best practices.

## 🛠️ Technical Stack

- **dbt**: Transformation logic, Jinja macros, tests, snapshots
- **Snowflake**: Data warehouse, external stages, time travel
- **AWS S3**: Raw data storage
- **IAM**: Secure authentication without hardcoded credentials
- **SQL**: Data transformation and modeling

## ✨ Key Features

### Cloud Integration
- Configured Snowflake external stages with IAM-based authentication
- Secure S3 data access following cloud security best practices
- No hardcoded credentials in codebase

### Modular Architecture
- 15+ dbt models organized across staging, intermediate, and mart layers
- Clear separation of concerns for maintainability
- Logical structure enabling quick onboarding for new team members

### Dimensional Modeling
- Implemented star schema with fact and dimension tables
- **Fact Tables**: bookings, reviews
- **Dimension Tables**: listings, hosts, locations
- Enables complex analyses with simple queries (e.g., "average price trends by neighborhood over time")

### Historical Tracking
- dbt snapshots implementing SCD Type-2 dimensions
- Complete history of listing changes over time
- Enables time-travel analysis for trend identification

### Performance Optimization
- Incremental models using dbt's merge strategies
- Optimized for production-scale data processing
- Designed with scalability in mind

### Code Quality
- Reusable Jinja macros standardizing transformations
- Reduced SQL repetition by 40%
- DRY (Don't Repeat Yourself) principles throughout

### Comprehensive Testing
- dbt schema tests: uniqueness, not-null, referential integrity
- Custom singular tests for business logic validation
- Data quality gates at each layer

### Documentation
- Auto-generated dbt docs with full lineage
- Column-level descriptions
- Visual transformation DAG
- Complete data dictionary

## 💡 What I'm Proud Of

1. **Dimensional Modeling**: The star schema design enables complex business analyses with straightforward SQL queries, making it accessible for analysts

2. **Security Best Practices**: Implemented IAM-based authentication patterns used in production cloud environments, ensuring secure data access

3. **SCD Type-2 Implementation**: Successfully tracked historical changes using dbt snapshots, enabling powerful time-travel analysis capabilities

4. **Modular Design**: Organized models logically with clear naming conventions and layer separation, enabling any teammate to understand the pipeline quickly

5. **Production Thinking**: Designed incremental models and testing strategies that would scale effectively in real production workloads

## 🎯 Key Technical Decision

**Why Medallion Architecture?**

I chose medallion architecture over direct transformation because it provides:
- Clear data quality boundaries at each stage
- Full auditability with raw data preserved in bronze
- Easier debugging when issues arise
- Alignment with modern data engineering best practices
- Flexibility to reprocess data at any layer independently

## 🌟 Real-World Application

The dimensional modeling and incremental loading patterns learned in this project have been applied professionally to build similar pipelines that:
- Reduced report generation time by 60%
- Enabled leadership to make evidence-based funding decisions
- Scaled to handle production workloads efficiently

## 📈 Sample Queries

The dimensional model enables powerful analytics:

```sql
-- Average price trends by neighborhood over time
SELECT 
    d.neighborhood,
    DATE_TRUNC('month', f.booking_date) as month,
    AVG(f.price) as avg_price
FROM fact_bookings f
JOIN dim_listings d ON f.listing_id = d.listing_id
GROUP BY 1, 2
ORDER BY 1, 2;

-- Host performance with historical context
SELECT 
    h.host_name,
    COUNT(DISTINCT b.booking_id) as total_bookings,
    AVG(r.rating) as avg_rating
FROM dim_hosts h
JOIN dim_listings l ON h.host_id = l.host_id
JOIN fact_bookings b ON l.listing_id = b.listing_id
LEFT JOIN fact_reviews r ON b.booking_id = r.booking_id
GROUP BY 1
ORDER BY 2 DESC;
```

## 🚀 Getting Started

### Prerequisites
- Snowflake account
- AWS account with S3 access
- dbt installed locally
- IAM credentials configured

### Setup
1. Clone the repository
2. Configure `profiles.yml` with your Snowflake credentials
3. Set up AWS IAM role for Snowflake external stage access
4. Run `dbt deps` to install dependencies
5. Run `dbt seed` to load seed data
6. Run `dbt run` to build models
7. Run `dbt test` to validate data quality

### Project Structure
```
├── models/
│   ├── staging/      # Bronze layer - raw data
│   ├── intermediate/ # Silver layer - cleaned data
│   └── marts/        # Gold layer - dimensional models
├── snapshots/        # SCD Type-2 tracking
├── tests/            # Custom data quality tests
├── macros/           # Reusable Jinja macros
└── docs/             # Documentation
```

## 📚 Documentation

Generate and view the full dbt documentation:
```bash
dbt docs generate
dbt docs serve
```

This will open an interactive documentation site showing:
- Complete data lineage
- Column-level descriptions
- Model relationships (DAG)
- Test coverage

## 🧪 Testing

Run all tests:
```bash
dbt test
```

Run tests for specific models:
```bash
dbt test --select staging
dbt test --select marts
```

## 📝 License

This project is for educational and portfolio purposes.

---

**Built with** ❤️ **using modern data engineering practices**