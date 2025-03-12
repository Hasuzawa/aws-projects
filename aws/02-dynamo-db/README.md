## Summary

Very simple tables for dynamo db, notice that they do not belong to any vpc nor subnet.

I deliberately included some letters not in English.

## About DynamoDB

Unlike some DB, PascalCase is the case convention for dynamodb in AWS.

Only the required fields needs to be defined as attribute, it is allowed to add field during usage not defined in the schema.

A local secondary key is what in relational database called index. Both aims to speed up query and reduce search effort.

hash_key is known as Partition key on the AWS console, and range key is known as Sort key.
