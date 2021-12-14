---
slug: conjur-cli
id: xyrko77gqoqa
type: challenge
title: Conjur CLI
teaser: Initialize the Docker-based Conjur CLI.
notes:
- type: text
  contents: In this challenge, you will be initializing the Docker-based Conjur CLI
    and authenticating as the admin user created in the previous challenge.
tabs:
- title: Terminal
  type: terminal
  hostname: host01
difficulty: basic
timelimit: 3600
---
Let's initialize Conjur CLI.

You only need to do it once.

**Initialize Conjur**

This will tell the Conjur CLI where the Conjur service is located to send commands to:

```
docker-compose exec client bash -c "echo yes | conjur init -u http://host01:8080 -a demo"
```

**Login to Conjur**

Let's login to Conjur.

First, let's save the admin API key to a variable to use. In the last challenge, it was saved to a file named `admin.out`:

```
api_key="$(grep API conjur/admin.out | cut -d: -f2 | tr -d ' \r\n')"
```

Next, we need to give the Conjur CLI the command to authenticate as "admin":

```
docker-compose exec client conjur authn login -u admin -p "$api_key"
```

**PRODUCTION NOTICE**

Please note that in this tutorial, we have saved `api_key` in `admin.out` file and as `api_key` environment variable.
In production, please keep the `api_key` in a safe location.