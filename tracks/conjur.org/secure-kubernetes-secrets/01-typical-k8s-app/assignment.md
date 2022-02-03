---
slug: typical-k8s-app
id: yhghbjfagvs6
type: challenge
title: Typical Kubernetes App
teaser: Short teaser here
notes:
- type: text
  contents: Long description here (overview.md from Katacoda)
tabs:
- title: Server
  type: terminal
  hostname: server
difficulty: basic
timelimit: 300
---
Let's deploy an app.

## Database

Let's setup a database for the application

```
kubectl apply -f /tmp/instruqt/env/conjur-k8s/db/db.yml
```

## App

We will make use of the pet store demo app from CyberArk [](https://github.com/conjurdemos/pet-store-demo) as an example.

To deploy, execute:

```
kubectl apply -f /tmp/instruqt/env/conjur-k8s/insecure/app.yml
```

Now the application has been installed.

```
kubectl get pods -n testapp -w
```

Let's wait for it to get started.

Wait for both `testapp-db` & `testapp-app` to have `Running` status.

Press `Ctrl-C` to stop and click `Check` to continue.