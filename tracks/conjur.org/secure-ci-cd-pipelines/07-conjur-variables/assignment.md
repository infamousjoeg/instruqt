---
slug: conjur-variables
id: vgqa7umi8c8j
type: challenge
title: Conjur Variables
teaser: Short teaser goes here.
notes:
- type: text
  contents: Long description goes here.
tabs:
- title: Terminal
  type: terminal
  hostname: jenkins-demo
difficulty: basic
timelimit: 300
---

1. Declare the variables, privileges, and entitlements. Copy the following policy as a template:

```
docker exec -it conjur-cli bash
cat > jenkins-app.yml << EOF
#Declare the secrets required by the application

- &variables
  - !variable web_password

# Define a group and assign privileges for fetching the secrets

- !group secrets-users

- !permit
  resource: *variables
  privileges: [ read, execute ]
  roles: !group secrets-users

# Entitlements that add the Jenkins layer of hosts to the group

- !grant
  role: !group secrets-users
  member: !layer /jenkins-frontend
EOF
exit
```

This policy does the following:
- Declares the variables to be retrieved by Jenkins.
- Declares the groups that have read & execute privileges on the variables.
- Adds the Jenkins layer to the group. The path name of the layer is relative to root.

Change the variable names, the group name, and the layer name as appropriate.

2. Load the policy into Conjur under the Jenkins policy branch you declared previously:

```
docker exec conjur-cli conjur policy load jenkins-app /jenkins-app.yml
```


### Set variable values in Conjur

Use the Conjur CLI to set variable values.

The CLI command to set a value is:

`conjur variable values add <policy-path-of-variable-name> <secret-value>`

For example:

```
docker exec conjur-cli conjur variable values add jenkins-app/web_password NotSoSecureSecret
```

