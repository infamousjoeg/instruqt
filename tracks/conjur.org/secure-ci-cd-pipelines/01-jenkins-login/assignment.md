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
- title: Target Website
  type: service
  hostname: jenkins-demo
  path: /
  port: 80
difficulty: basic
timelimit: 300
---
Let's log in to Jenkins

1. Select the `Jenkins Console` tab.

2. Login as `admin` with password `344827fbdbfb40d5aac067c7a07b9230`