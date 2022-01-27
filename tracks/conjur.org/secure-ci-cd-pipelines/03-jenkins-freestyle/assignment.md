---
slug: jenkins-freestyle
id: ix1ufrkhft87
type: challenge
title: Jenkins Freestyle
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
Now, let's take a look at a typical freestyle project.

1. Click on `Typical Freestyle Project`.

2. To view the project details, Click `Configure`.

3. Click the `Build` tab and click on `Advanced` button to show the details.

You can see here the project is configured to connect to the target web app `http-auth-server` using the credential `theServerAccount`.