## Summary

AWS Step Functions is a state machine to execute code.

types
- standard
- express

## Amazon States Language

Definition of the Step Functions in json (the official term JSONata)

```
# brackets can be used to interpolate
{% %}
# JSONPath (the dollar sign $) can be used to reference values within interpolation
{% $states.input %}
```
The JSONPath practically permits a jq-style manipulation on json values.
