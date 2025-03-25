## Summary

SQS and SNS features

## SQS

SQS (simple queueing service)

### Delay & Receive wait time & Visibility timeout

Visibility timeout is approximately the time a consumer has to complete a request before the message becomes visible again and can be received by another consumer.

Delay is the min time a message must remain in queue before it becomes visible to consumers, useful for consumers with 'cooldown' after processing a message.

Receive wait time controls short and long polling behvaior.

### Deduplication

The MessageDeduplicationId can be used in fifo queue to ensure only one instance is delivered within a 5 minute interval.

MessageDeduplicationId is not needed if message body can differentiate each message.

### Message Group

MessageGroupId can be used in fifo queue to group messages. Messages with same groupId must be processed one at a time, in order. Essentially, this partition the queue into N lanes.

A fifo can be conceptually thought as a queue with all messages with same groupId.

### Dead Letter Queue & Redrive

A queue use redrive_allow_policy to specify which queue can use it as a dlq.
A queue use redrive_policy to set the dlq to send to, if the destination is a deny-all queue this will fail.

Once a message exceed the max receive count, it will be send to a DLQ if there is one.

A DLQ of a fifo queue must also be fifo, same goes for standard queue.

You can put the messages in DLQ back into a queue, but this could cause circular queues.

## SNS

features
- fifo devliery
- archive (fifo only, enablement needed)
- delivery status log
- downstream dead letter queue SQS
- active tracing (extra charge)

Some common downstream subscribers
- SQS
- mobile devices
- SMS

Success / Failure feedback downstream
- lambda
- sqs
- firehose

Note:
- topic cannot be deleted when there is archive
- archived message is deleted when archive policy is deactivated
