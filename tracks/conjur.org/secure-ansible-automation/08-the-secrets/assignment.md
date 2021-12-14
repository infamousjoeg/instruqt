---
slug: the-secrets
id: g1hcjnuzsjs1
type: challenge
title: The Secrets
teaser: Initialize the secret variables previously loaded via Conjur Policy with values.
notes:
- type: text
  contents: In this challenge, we'll be initializing the secret variables creating
    in a previous challenge via Conjur Policy with values using the Docker-based Conjur
    CLI.
tabs:
- title: Terminal
  type: terminal
  hostname: host01
difficulty: basic
timelimit: 300
---

Let's centralize the secrets & server info and add them to Conjur.

**host01**

Host 1 IP:
```
docker-compose exec client conjur variable values add server/host1/host "host01"
```
Host 1 username:

```docker-compose exec client conjur variable values add server/host1/user "service01"
```
Host 1 password:

```
docker-compose exec client conjur variable values add server/host1/pass "W/4m=cS6QSZSc*nd"
```

**host02**

Host 2 IP:
```
docker-compose exec client conjur variable values add server/host2/host "host02"
```
Host 2 username:
```
docker-compose exec client conjur variable values add server/host2/user "service02"
```
Host 2 password:
```
docker-compose exec client conjur variable values add server/host2/pass "5;LF+J4Rfqds:DZ8"
```