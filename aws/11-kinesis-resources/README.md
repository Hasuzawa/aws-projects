## Summary

All Kinesis resources work with streamed data

## Kinesis Data Stream

real-time data stream
- shard
- retent data for up to 1 year
- server-side encryption (both the producer and consumer needs access to interact with the stream)

shard

|                | Value            |
|----------------|------------------|
| max read       | 5 transactions   |
| max data read  | 2 MB/s           |
| max write      | 1000 records / s |
| max data write | 1 MB/s           |

partition key



## Kinesis Data Firehose

ingest data from sources, transform dataformat and write to destination
- retry
- buffer (reduce frequency of data delivery at expense of delay in data)
- compression

source
- Kinesis Data Stream
- PostgreSQL, MySQL (detect changes, must choose Iceberg Table as destination)
- HTTP PUT (most SDK support this, as well as some AWS resource, e.g. API Gateway)
- MSK (kafka cluster)

destination
- S3
- Apache Iceberg Table

transformations supported
- data format
- filter

## Kinesis Analytics



## Kinesis Video Streams


