## Summary

EventBridge coordniates events sent from source and deliver to destination.

## Event Bridge

Despite its broad scope, EventBrdige is a regional service.

## Bus

Bus use rules to match events against event patterns, a match would be send to target of each rule.

Each rule can has up to 5 targets.

## Pipe

Route event from a single source to single target, with optional filtering, enrichment.

It needs an execution role, similar to lambda.

Data source
- SQS
- API Gateway
- DynamoDB
- Data Kinesis

Destination
- (all from data source)
- event bus
- batch job
- lambda function
- reshift
- sagemaker

Enrichment by
- lambda
- step functions
- API gateway
- API destination

## Archive

Each bus can have archive to retent received events. One bus can have multiple archives.
- event pattern matching
- retention period
- replay
- encryption

Replayed events have a field replay-name, you can filter this to prevent it from being archived.
```json
{
	"replay-name": [{
		"exists": false
	}]
}
```

## Schedule

Schedule can emit events with cron expression.

## Target

targets are downstream receiver of matched event rule or schedule.
- SQS
- event bus
- kinesis stream
- ECS
- sagemaker
- SSM (can controll instances)
