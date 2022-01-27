---
slug: conjur-policy
id: z78qdxclt3ba
type: challenge
title: Conjur Policy
teaser: Create Conjur Policy for Ansible to access secrets using a Host Identity.
notes:
- type: text
  contents: In this challenge, you will be creating Conjur Policy files that define
    the resources and authorizations allowed within the Secrets Manager.
tabs:
- title: Terminal
  type: terminal
  hostname: host01
- title: Code Editor
  type: code
  hostname: host01
  path: /root/conjur
difficulty: basic
timelimit: 300
---
We need to create an identity, called a Host Identity, for Ansible to use to authenticate to the Conjur service. We also need to create authorization definitions on what Ansible has access to. In Conjur, we do this through policy-as-code.

Below is our "root" policy. It is the foundation of where the rest of our policy will branch from. In our "root" policy, we'll just be declaring the policies that will branch from it. In our case, it'll be one for server SSH user/pass secrets and one for Ansible's host identity and authorizations.

Copy the following and paste it on the "Code Editor" tab in a new policy file named `conjur.yml`:

```
- !policy
  id: server

- !policy
  id: ansible
```

Next, we need to create a Conjur Policy file that defines the secret variables and authorizes resources to access them.

Copy the following and paste it on the "Code Editor" tab in a new policy file named `server.yml`:

```
- &variables
  - !variable host1/host
  - !variable host1/user
  - !variable host1/pass
  - !variable host2/host
  - !variable host2/user
  - !variable host2/pass

- !group secrets-users

- !permit
  resource: *variables
  privileges: [ read, execute ]
  roles: !group secrets-users

# Entitlements
- !grant
  role: !group secrets-users
  member: !layer /ansible
```

Finally, we need to create the Host Identity for Ansible to be able to authenticate to the Conjur service and add it as a member of groups that were previously authorized to access server secrets:

Copy the following and paste it on the "Code Editor" tab in a new policy file named `ansible.yml`:

```
- !layer

- !host ansible-01

- !grant
  role: !layer
  member: !host ansible-01

- !host-factory
  layers: [ !layer ]
```

We'll load all these policies into Conjur using the Docker-based Conjur CLI in the next challenge.