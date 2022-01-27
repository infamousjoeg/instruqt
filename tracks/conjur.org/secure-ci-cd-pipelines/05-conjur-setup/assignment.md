---
slug: conjur-setup
id: bcaiqxbzwxmb
type: challenge
title: Conjur Setup
teaser: Short teaser goes here.
notes:
- type: text
  contents: |-
    It works well, right?   Jenkins even masked the credentials.

    Think about your environment, where you have various systems and zones, not to mention dev, staging, UAT & production sites.

    And don't forget your on-premise and cloud environments.

    - How will you change the secrets of various environments?
    - How do you make sure the process is secure?
    - How do you change all the secrets when security incident happens?
    - How do you know who or what systems has access to the secrets?
    - Do you have the visibility on them when they access the secrets?
tabs:
- title: Terminal
  type: terminal
  hostname: jenkins-demo
- title: Conjur UI
  type: service
  hostname: jenkins-demo
  path: /
  port: 8080
difficulty: basic
timelimit: 300
---
Conjur has been started.
We need to preform the following steps to make sure it's up & running.


## Verify the system is up & running

To verify, visit the `Conjur UI` tab and make sure the page loads and says Conjur is up and running.

## Creating an account

Now let's setup an account to Conjur.

In the `Terminal` tab, complete the following commands:

```
docker exec conjur conjurctl account create quick-start | tee admin_key
```

At the end of the message, an API key for `admin` should be returned.
This is the password for the administrator.

_Prevent data loss: The conjurctl account create command gives you the public key and admin API key for the account you created. Back them up in a safe location._

## Initialize Conjur Client

To initialize conjur client, execute:
```
docker exec conjur-cli conjur init -u conjur -a quick-start
```

## Logon to Conjur

To login to Conjur,execute:
```
export admin_api_key="$(cat admin_key|awk '/API key for admin/ {print $NF}'|tr '  \n\r' ' '|awk '{$1=$1};1')"
docker exec conjur-cli conjur authn login -u admin -p $admin_api_key
```

It should display `Logged in` once you are successfully logged in

