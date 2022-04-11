---
slug: secure-playbook
id: lzu3qyuydsy3
type: challenge
title: Secure Playbook
teaser: Secure the Ansible playbook initially used to securely fetch secrets just-in-time
  from Conjur Secrets Manager.
notes:
- type: text
  contents: In this challenge, we'll be creating a more secure Ansible playbook and
    using an inventory file that contains NO SECRETS. The secrets for connecting to
    remote nodes will be fetched from the Conjur service just-in-time and used by
    Ansible.
tabs:
- title: Terminal
  type: terminal
  hostname: host01
- title: Code Editor
  type: code
  hostname: host01
  path: /root/secure-playbook
difficulty: basic
timelimit: 300
---
Let's convert the Conjur Host Identity to make it compatible with Ansible. We want to "urlify" it by changing any `/` in the host identity to `%2F`:

```
sed -i "s=login host/=login host%2F=" /etc/conjur.identity
```

Next, let's create an inventory file that defines our hosts that Ansible should connect to and execute our secure playbook on. Paste the following on the "Code Editor" tab in a new file named `inventory`:

```
[demo_servers]
host01
host02
```

We also need to create the secure playbook that we'll be executing on the hosts contained in our inventory file. Paste the following on the "Code Editor" tab in a new file named `playbook.yml`:

```
- hosts: demo_servers
  vars:
      ansible_connection: ssh
      ansible_host: "{{ lookup('conjur_variable', 'server/' + inventory_hostname+ '/host') }}"
      ansible_user: "{{ lookup('conjur_variable', 'server/' + inventory_hostname+ '/user') }}"
      ansible_ssh_pass: "{{ lookup('conjur_variable', 'server/' + inventory_hostname+ '/pass') }}"

  tasks:
    - name: Get user name
      shell: whoami
      register: theuser

    - name: Get host name
      shell: hostname
      register: thehost

    - debug: msg="I am {{ theuser.stdout }} at {{ thehost.stdout }}"
```

Finally, let's execute the Ansible playbook against the hosts defined in the `inventory` file:

```
ansible-playbook -i secure-playbook/inventory secure-playbook/playbook.yml
```