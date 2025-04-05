## Summary

```
root
| Root (account)
| sales
| engineering
  | hardware
    | jack
  | software
    | mary
```

## Organization

Organization is a tree of organization unit and account under one root.

## Organization Account

account in organization is different from IAM user.

By default, an account would be added under Root, but can be moved to another OU.

## Organization Unit

Newly created organization units do not have any administrator nor account.

## Service, Resource Control Policy

SCP Impose a lockdown on permission for all accounts in an organization.
RCP does that for resources (e.g. S3 bucket, database).



## Tag Policy


