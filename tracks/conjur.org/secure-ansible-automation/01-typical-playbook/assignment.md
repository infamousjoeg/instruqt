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
      <h2>Local Server (Host 1)</h2>
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
      <h2>Remote Server (Host 2)</h2>
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
tabs:
- title: Terminal
  type: terminal
  hostname: host01
- title: Inventory File
  type: code
  hostname: host01
  path: /root/insecure-playbook
difficulty: basic
timelimit: 3600
---
Let's take a look at a basic inventory and then test using a simple playbook file.

**Inventory File**

First, check out the inventory file on the `Inventory File` tab. This is a common example of how inventory files hold connection information and secrets for Ansible to make connections to remote hosts.

**Playbook**

Next, review the insecure-playbook.yml Ansible playbook file to see what commands we'll be running in it.

Once you're ready, run the `ansible-playbook` command below to run the playbook file against the remote hosts declared in the inventory file:

```
ansible-playbook -i insecure-playbook/inventory insecure-playbook/insecure-playbook.yml
```