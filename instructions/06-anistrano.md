# Step 06 - Anistrano/Deployment

## Install needed packages

Add `rsync` and `git` to the `server_packages`.

## Install Anistrano

Install the roles `ansistrano-deploy` and `ansistrano-rollback` from `carlosbuenosvinos`.

### Configure deploy

Add the following as host vars

```yaml
ansistrano_deploy_from: "{{ playbook_dir }}/../../" # Where my local project is (relative or absolute path)
ansistrano_deploy_to: "/var/www/bolt" # Base path to deploy to.
ansistrano_keep_releases: 5

# Arrays of directories and files to be shared.
# The following arrays of directories and files will be symlinked to the current release directory after the 'update-code' step and its callbacks
# Notes:
# * Paths are relative to the /shared directory (no starting /)
# * If your items are in a subdirectory, write the entire path to each shared directory
ansistrano_shared_paths:
  - app/database
  - public/thumbs
  - public/files
ansistrano_shared_files: []

ansistrano_deploy_via: "git"
ansistrano_git_repo: https://github.com/pixelart-training/phpnw17-terraform-ansible.git # Location of the git repository

ansistrano_before_setup_tasks_file: "{{ playbook_dir }}/deploy/before-setup.yml"
ansistrano_before_symlink_tasks_file: "{{ playbook_dir }}/deploy/before-symlink.yml"
ansistrano_after_symlink_tasks_file: "{{ playbook_dir }}/deploy/after-symlink.yml"
```

Add a `deploy/before-setup.yml` to change the ownership of `/var/www` to `www-data`

Add a `deploy/before-symlink.yml` to run `composer install`.

Create a `deploy/after-symlink.yml` to restart the fpm daemon:

### Create a deploy playbook

Create a `deploy.yml` playbook with `become_user: www-data`.

### Run it

Add it to the makefile and run it.

## Troubleshooting

If you messed up you can save your work and either checkout the previous step to start again or checkout the next step to follow along:

```bash
# preserve your work
git add .
git commit -m "Saving my work from Step 06"
git branch 06-wip

# reset back to the previous step
git reset --hard 05-solution

# or get back on track with the next step to follow along
git reset --hard 06-solution
```
