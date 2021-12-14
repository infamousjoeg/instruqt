---
slug: install-conjur
id: jtmiomkcmlxz
type: challenge
title: Install Conjur
teaser: Install Conjur Secrets Manager and initialize the service.
notes:
- type: text
  contents: |-
    We are going to eliminate the risk by doing the following steps:

    1. Deploy the Conjur Lookup Plugin for Ansible
    2. Install Conjur Secrets Manager and the CLI
    3. Prepare and load Conjur Policy
    4. Centralize the secrets within Conjur Secrets Manager
    5. Rewrite the inventory and Ansible playbook for better security
tabs:
- title: Terminal
  type: terminal
  hostname: host01
- title: Conjur UI
  type: service
  hostname: host01
  path: /
  port: 8080
difficulty: basic
timelimit: 300
---
We initiated Conjur Secrets Manager for you in the background. Now, let's verify that it is complete by checking the web interface.

To access the web interface, click on the "Conjur UI" tab. You should see a webpage saying "Conjur is up and running!"

To create an account in Conjur, execute the following in the "Terminal" tab:
```
docker-compose exec conjur conjurctl account create demo | tee admin.out
```