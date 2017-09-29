# Step 03 - Install php

## Add the playbook

Create your playbook as `main.yml` to install php on the server. Use this snippet as base, so you can set the instance IP dynamically from the CLI.

```yaml
- hosts: my_instance
  remote_user: ubuntu
  become: true
  gather_facts: false

  vars_prompt:
    - name: my_instance_ip
      prompt: "Enter IP address of your AWS instance"

  tasks:
    - name: Set IP as fact
      set_fact:
        jenkins_ip: "{{ my_instance_ip }}"
    - name: Install Python
      raw: "apt-get update && apt-get -y -q install python"

- hosts: my_instance
  remote_user: ubuntu
  become: true
  gather_facts: true

  tasks:
    # ...
```

### Add your hosts file

Add your AWS instance into a `hosts` file beside `main.yml` with the instance ip variable.

### Add the variables

Add your `php_packages` to `host_vars/my_instance.yml`

### Run it

Run it with bash subshell of the terraform instance IP output.

## Troubleshooting

If you messed up you can save your work and either checkout the previous step to start again or checkout the next step to follow along:

```bash
# preserve your work
git add .
git commit -m "Saving my work from Step 04"
git branch 04-wip

# reset back to the previous step
git reset --hard 03-solution

# or get back on track with the next step to follow along
git reset --hard 04-solution
```
