---
slug: load-policy
type: challenge
title: Load Policy
teaser: Load Conjur Policy files into the Conjur service.
notes:
- type: text
  contents: |-
    In this challenge, we'll be using the Docker-based Conjur CLI to load the policies created in the previous challenge into the Conjur service.
tabs:
- title: Terminal
  type: terminal
  hostname: host01
difficulty: basic
timelimit: 3600
---
Now, let's copy the policy files to Docker-based Conjur CLI container and load them.

**Load Root Policy**

```
cd conjur
docker cp conjur.yml conjur_client_1:/tmp/
docker-compose exec client conjur policy load --replace root /tmp/conjur.yml
```

**Load Ansible Policy**

```
docker cp ansible.yml conjur_client_1:/tmp/
docker-compose exec client conjur policy load ansible /tmp/ansible.yml  | tee ansible.out
```

**Load Server Policy**

```
docker cp server.yml conjur_client_1:/tmp/
docker-compose exec client conjur policy load server /tmp/server.yml
```