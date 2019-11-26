`yarn install`

`yarn start` or `yarn start:prod`

### Connect to database

exec: `psql -U postgres -d phattv_ecommerce`

import: `psql phattv_ecommerce < schema.sql`

export: `pg_dump -U postgres phattv_ecommerce > schema.sql`
