## Summary

Cloud Formation allows provision of various AWS resource with template.
It can be thought of as AWS's own version of Infrastructure as Code.

features
- stack, which is one deployment from template
- stack set,

## Template

templates are blueplans for stack, they can be stored in S3 bucket.

Deleting a stack will delete associated resources.

## Stack

A stack is created from a template.
- custom action upon creation, update failure (most commonly, rollback)

Stack events record the creation, deletion, rollback of resources.


## Infrastructure Composer

Graphical UI to drag and compose cloud resources.


## CloudFormation Template

use special !Ref for resources



## Further
