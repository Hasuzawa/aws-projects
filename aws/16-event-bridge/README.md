## Summary

EventBridge coordniates events sent from source and deliver to destination.

## Event Bridge



EventBrdige is a regional service.

## Bus

Bus use rules to match events against event patterns, a match would be send to target of each rule.

## Pipeline

## Schema

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
