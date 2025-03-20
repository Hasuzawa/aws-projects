## Summary

```

api_gateway_rest_api
--> api_gateway_deployment
--> api_gateway_stage



-->

```

## Amazon Athena

S3 -> 
S3 table bucket
-> s3tablescatalog/{ bucket_name }
-> s3 namespace (aka athena database)

Athena resources (workgroup, database) does not allow hypen, only _ for symbols

Athena can analyze external table or iceberg table created from s3 bucket.

## Iceberg Table

(Apache) Iceberg is an open-source data format for data analysis with query statement similar to SQL.

Example creating Iceberg table
```sql
CREATE TABLE product (
  id integer,
  name string,
  on_sale boolean
)
LOCATION 's3://s3-bucket/'
TBLPROPERTIES ( 'table_type' = 'ICEBERG' );
```

## Different data storage

| Resource | Data Query | Query Language |
|----------|------------|----------------|
| S3       | Athena     | Athena SQL     |
| Dynamo   | RedShift   | PartiQL        |



## API Gateway

Essentially REST-api in OpenAPI spec.
