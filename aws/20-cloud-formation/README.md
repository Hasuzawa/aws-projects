## Summary

Cloud Formation allows provision of various AWS resource with template.
It can be thought of as AWS's own version of Infrastructure as Code.

features
- stack, which is one deployment from template
- stack set, which is a blueprint to deploy stacks

## Template

templates are blueplans for stack, they can be stored in S3 bucket.

Deleting a stack will delete associated resources.

## Stack

A stack is created from a template.
- custom action upon creation, update failure (most commonly, rollback)
- change set

Stack events record the creation, deletion, rollback of resources.

## Stack Set

A Stack Set is a blueprint for deployment.

CloudFormation is a regional service, so to deploy across region or account, Stack Set is preferred.

## Infrastructure Composer

Graphical UI to drag and compose cloud resources.

## CloudFormation Template

```yaml
# this would appear in the stack table on AWS Console
Description:

# all AWS resources in the stack
Resources:

# input variables
Parameters:

# outputs are visible after stack creation and update, can be exported and referenced by other stack
Outputs:
```

Some special directive in CloudFormation

- !Ref		reference an AWS resource, parameter
- !Sub		string interpolation
- !GetAtt   get attribute of resource

## Lifecycle Policy

CreationPolicy
- rules to fulfill before the resource is declared creation complete
- common in ASG

DeletionPolicy
- how the resource is handled when the stack is deleted
- use retain to keep it
- use snapshot for supported storage resources to create a snapshot before deletion

UpdatePolicy
- how update to resource is performed
- stop or stop the resource
- for ASG there are additional config as replacement strategy

## Drift

The resources might deviate from the cloud formation during operation. This is called drift.
