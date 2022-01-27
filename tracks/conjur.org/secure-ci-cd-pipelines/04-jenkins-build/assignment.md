---
slug: jenkins-build
id: cpp5yfjhq3jj
type: challenge
title: Jenkins Build
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
Let's build the project and make sure it's working

1. Click on `Typical Freestyle project` to go back the project page

2. Click `Build Now` on the left.   After a moment, a new build history will be shown

3. Click on the new build number under `Build` & choose `Console Output` on the left menu

4. `Response Code: HTTP/1.0 200 OK` & `Finished: SUCCESS` should be shown in the page.
   Meaning that Jenkins has successfully connect to the target web app with authentication successfully.