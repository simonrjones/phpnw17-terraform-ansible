# Step 05 - Enter the galaxy

## Create your first role

Instead of having all your tasks in the playbook, move your tasks into a separate role. Create a `roles/server/tasks/main.yml` and move your tasks into it. Reference the role from the playbook.

Remove the php installation for now.

Add the following task too, which shouldn't do anything as long as we don't define any `server_packages`.

```yaml
- name: Install Extra Packages
  apt: name={{ item }} state=latest
  with_items: '{{ server_packages }}'
  when: server_packages is defined
```

### Recreate it

Taint your instance and rerun terraform and ansible to install everything again.

## Enter the galaxy

Install the roles composer, php and nginx from geerlingguy from Ansible Galaxy.

### Configure the host vars

Copy the `my_instance` folder from `examples/step-05/` into your host vars and remove the existing `my_instance.yml`.

The config is more complex, but you can try to compare the provided host vars with the `README.md` of each extension to understand it.

Please replace the `server_name` in `webserver.yml` with your initials (replace the `foo` with it).

### Create a new security group ingress rule

The AWS instance is currently only accessible via SSH, please create another rule for HTTP and update everything then.

## Troubleshooting

If you messed up you can save your work and either checkout the previous step to start again or checkout the next step to follow along:

```bash
# preserve your work
git add .
git commit -m "Saving my work from Step 05"
git branch 05-wip

# reset back to the previous step
git reset --hard 04-solution

# or get back on track with the next step to follow along
git reset --hard 05-solution
```
