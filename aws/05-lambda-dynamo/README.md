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


## Different data storage

| Resource | Data Query | Query Language |
|----------|------------|----------------|
| S3       | Athena     | Athena SQL     |
| Dynamo   | RedShift   | PartiQL        |



## API Gateway

Essentially REST-api in OpenAPI spec.
