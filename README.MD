# Connect to database

- Install [postges](https://www.postgresql.org/download/)
- `psql` or `psql -U postgres -d phattv_ecommerce`
- `CREATE DATABASE phattv_ecommerce;`
- `ctrl + d`
- import: `psql phattv_ecommerce < schema.sql`
- export: `pg_dump -U postgres phattv_ecommerce > schema.sql`

# Develop

`yarn install`

`yarn start` or `yarn start:prod`
