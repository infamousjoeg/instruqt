---
slug: dynamic-enrollment
id: 0mwz85vomhdy
type: challenge
title: Dynamic Enrollment
teaser: Dynamically enroll the Ansible host as a trusted Host Identity of the Conjur
  service.
notes:
- type: text
  contents: In this challenge, we'll be installing the Conjur Host Identity role from
    Ansible Galaxy and granting our Ansible host dynamically to authenticate to the
    Conjur service.
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
We will now grant a Host Identity to the Ansible server dynamically.

1. Install the Conjur role using the following syntax:

```
ansible-galaxy install cyberark.conjur-host-identity
```

2. Create a host factory token:

```
docker-compose exec client conjur hostfactory token create ansible | tee conjur/hftoken
```

3. Save the token as environment variable:

```
export HFTOKEN="$(grep token conjur/hftoken | cut -d: -f2 | tr -d ' \r\n' | tr -d ','  | tr -d '\"' )"
```

4. Prepare an inventory file. Paste the following into the "Code Editor" tab in a new file named `inventory`:

```
[servers]
host01
```

5. Prepare a playbook to grant the Ansible host (host01) with a Conjur Host Identity. Paste the following into the "Code Editor" tab in a new file named `grant_conjur_id.yml`:

```
- hosts: servers
  roles:
    - role: cyberark.conjur-host-identity
      conjur_appliance_url: "http://host01:8080"
      conjur_account: "demo"
      conjur_host_factory_token: "{{lookup('env', 'HFTOKEN')}}"
      conjur_host_name: "{{inventory_hostname}}"
      conjur_validate_certs: "false"
```

6. Grant it!

```
ansible-playbook -i conjur/inventory conjur/grant_conjur_id.yml
```