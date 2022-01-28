---
slug: conjur-project
id: uwrcgs9qnlwv
type: challenge
title: Conjur Project
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
- title: Terminal
  type: terminal
  hostname: jenkins-demo
difficulty: basic
timelimit: 300
---
Let's test the setup by copying & updating the project

1. To create a new project, go back to `Demo` & click `New Item`

 - Enter an item name:

   ```
   Secure Freestyle Project
   ```
 - Type:

   ```
   Freestyle Project
   ```

2. Click OK

3. Next, we need to add a new binding.
   Check `Use secret text(s) or files(s)` under `Build Environment`

4. Under `Binding`, click `Add > Conjur Secret Credentials`

- Variable:

  ```
  WEB_PASSWORD
  ```

- Credentials > Specific credentials: `ConjurSecret:jenkins-app/web_password/*Conjur*()`

1. Click `Build` tab at the top

2. Click `Add build step > Execute shell`

   Command to add:
   ```
   curl -Is -u theServerAccount:$WEB_PASSWORD http://http-auth-server
   ```

3. Click Save

4. Let's verify the setup by clicking Build Now
