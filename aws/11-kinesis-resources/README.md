## Summary

All Kinesis resources work with streamed data

## Kinesis Data Stream

real-time data stream
- shard, which acts a data channel
- retent data for up to 1 year
- server-side encryption (both the producer and consumer needs access to interact with the stream)
- enhanced fanout (dedicated throughput for one consumer, max 20)
- EventBrdige pipe processing

shard

|                | Value            |
|----------------|------------------|
| max read       | 5 transactions   |
| max data read  | 2 MB/s           |
| max write      | 1000 records / s |
| max data write | 1 MB/s           |

partition key
- used to generate a hash, which determine the shard it is sent to (i.e. record with same parition key is sent to same shard)
- record with same partition key are processed FIFO in same shard
- should have a high ratio of partition key / shard count, otherwise uneven distribution could cause some shard to reach throughput limit while others are not full at capacity

to summarize, partition key trades risk of uneven distribution of record sent to shard for FIFO order.

## Kinesis Data Firehose

ingest data from sources, transform dataformat and write to destination
- lambda function for transformation, flitering
- conversion to parquet or ORC, which are columnar file format
- retry
- buffer (reduce frequency of data delivery at expense of delay in data)
- compression (e.g. gzip, snappy)

source
- Kinesis Data Stream
- PostgreSQL, MySQL (detect changes, must choose Iceberg Table as destination)
- HTTP PUT (most SDK support this, as well as some AWS resource, e.g. API Gateway)
- MSK (kafka cluster)
- PostgreSQL, MySQL

destination
- S3 bucket
- OpenSearch, ElasticSearch
- Apache Iceberg Table
- RedShift
- third party platform, Snowflake, Honeycomb, Datadog

## Kinesis Analytics

Deprecated.

## Managed Apache Flink

Now the recommended resource to perform analytics on streamed data
- Stream app
- Studio notebooks

## Kinesis Video Streams


