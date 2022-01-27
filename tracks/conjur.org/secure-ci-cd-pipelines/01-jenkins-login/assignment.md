---
slug: jenkins-login
id: 6kgaxsiffkyd
type: challenge
title: Login to Jenkins
teaser: Short teaser goes here.
notes:
- type: text
  contents: Long description goes here. (prerequisites.md from Katacoda)
tabs:
- title: Terminal
  type: terminal
  hostname: jenkins-demo
- title: Conjur UI
  type: service
  hostname: jenkins-demo
  path: /
  port: 8080
- title: Jenkins Console
  type: service
  hostname: jenkins-demo
  path: /
  port: 8081
difficulty: basic
timelimit: 300
---
First, let's make sure that all the containers were started. Run the following command in the `Terminal` and make sure the following containers are returned:

```
docker ps
```

* conjur
* conjur-cli
* database
* jenkins
* http-auth-server

If all containers are reported, we're ready to log in to Jenkins.

1. Select the `Jenkins Console` tab.

2. Login as the following username:

```
admin
```

3. Using the following password:

```
344827fbdbfb40d5aac067c7a07b9230
```