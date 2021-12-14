---
slug: typical-playbook
id: fbbt613vjcdb
type: challenge
title: Typical Playbook
teaser: Explore and run a typical Ansible playbook on hosts defined in an inventory.
notes:
- type: text
  contents: |-
    <table border=0><tr><td valign="top">
      <strong>Local Server (Host 1)</strong>
      <ul>
        <li>Hostname: host01</li>
        <li>Software installed:</li>
        <ul>
          <li>CyberArk Conjur OSS</li>
          <li>Ansible</li>
          <li>sshd</li>
        </ul>
        <li>Service account:</li>
        <ul>
          <li>username: <code>service01</code></li>
          <li>password: <code>W/4m=cS6QSZSc*nd</code></li>
        </ul>
      </ul>
    </td><td valign="top">
      <strong>Remote Server (Host 2)</strong>
      <ul>
        <li>Hostname: host02</li>
        <li>Software installed:</li>
        <ul>
          <li>sshd</li>
        </ul>
        <li>Service account:</li>
        <ul>
          <li>username: <code>service02</code></li>
          <li>password: <code>5;LF+J4Rfqds:DZ8</code></li>
        </ul>
      </ul>
    </td></tr></table>
    <h2 align="center">Please be patient while we build the environment in the background...</h2>
tabs:
- title: Terminal
  type: terminal
  hostname: host01
- title: Code Editor
  type: code
  hostname: host01
  path: /root/insecure-playbook
difficulty: basic
timelimit: 300
---
Before we can do anything, we must create an inventory defining hosts Ansible will connect to and a playbook Ansible will execute against those hosts.

**Inventory File**

First, let's create an inventory file on the "Code Editor" tab. This is a common example of how inventory files hold connection information and secrets for Ansible to make connections to remote hosts. Paste the following to the "Code Editor" tab in a new file called `inventory`:

```
[demo_servers]
host01 ansible_connection=ssh ansible_ssh_user=service01 ansible_ssh_pass=W/4m=cS6QSZSc*nd
host02 ansible_connection=ssh ansible_ssh_user=service02 ansible_ssh_pass=5;LF+J4Rfqds:DZ8
```

**Playbook**

Next, let's create an insecure-playbook.yml Ansible playbook file and add what commands we'll be running in it. Paste the following to the "Code Editor" tab in a new file called `insecure-playbook.yml`:

```
- hosts: demo_servers
  tasks:
    - name: Get user name
      shell: whoami
      register: theuser

    - name: Get host name
      shell: hostname
      register: thehost

    - debug: msg="I am {{ theuser.stdout }} at {{ thehost.stdout }}"
```

Once you're ready, run the `ansible-playbook` command below on the "Terminal" tab to run the playbook file against the remote hosts declared in the inventory file:

```
ansible-playbook -i inventory insecure-playbook.yml
```