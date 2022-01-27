---
slug: conjur-newcred
id: bvgipi4o9nfp
type: challenge
title: Conjur New Credential
teaser: Short teaser goes here.
notes:
- type: text
  contents: Long description goes here.
tabs:
- title: Jenkins Console
  type: service
  hostname: jenkins-demo
  path: /
  port: 8081
difficulty: basic
timelimit: 300
---
Visit `Jenkins > Demo > Credentials > Folder > Global credentials (unrestricted) > Add Credentials` on the `Jenkins Console` tab to create a new credential

-  Kind: `Conjur Secret Credentials`
-  Variable Path:

  ```
  jenkins-app/web_password
  ```
- ID:
  ```
  WEB_PASSWORD
  ```

This is the complete Conjur ID of the variable. This includes the policy path where the variable is defined.

Click "OK" to save it
