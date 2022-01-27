---
slug: conjur-plugin
id: yeailb9zpvkk
type: challenge
title: Conjur Plugin
teaser: Short teaser goes here.
notes:
- type: text
  contents: Long description goes here.
tabs:
- title: Terminal
  type: terminal
  hostname: jenkins-demo
- title: Jenkins Console
  type: service
  hostname: jenkins-demo
  path: /
  port: 8081
difficulty: basic
timelimit: 300
---
1. Download the `Conjur.hpi` file from https://github.com/cyberark/conjur-credentials-plugin/releases

2. Navigate to `Jenkins -> Manage Jenkins -> Manage Plugins -> Advanced` in the `Jenkins Console` tab.
3. In the Upload Plugin section, browse for the downloaded copy of `Conjur.hpi`.

4. Click `Upload`

5. After the upload is complete, give the following command in the `Terminal` tab:

```
docker restart jenkins
```