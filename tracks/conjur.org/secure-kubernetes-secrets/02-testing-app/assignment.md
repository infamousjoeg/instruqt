---
slug: testing-app
id: msjbis7twajr
type: challenge
title: Testing App
teaser: Short teaser here
notes:
- type: text
  contents: Long description here
tabs:
- title: Server
  type: terminal
  hostname: server
difficulty: basic
timelimit: 300
---
## Get the URL

First, let's get the endpoint of the app we just deployed:

```
export URL=$(kubectl describe  service testapp-insecure --namespace=testapp |grep Endpoints | awk '{print $2}'  )
```

Next, let's make sure the service is up and running:

```
curl "$URL"/pets
```

If a `curl` error is returned, that means the application is still being started. Please wait for a couple of moments and try again. It should return `[]` if the application is up.

## Test the app

To add a new message with a random name, execute:

```
curl  -d "{\"name\": \"$(shuf -n 1 /usr/share/dict/american-english)\"}" -H "Content-Type: application/json" "$URL"/pet
```

Now let's list all the messages by executing:

```
curl -s "$URL"/pets | jq .
```

You can repeat the above actions to create & review multiple messages.

When you're finished, click `Check` to continue.