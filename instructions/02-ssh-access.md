# Step 02 - SSH access

Without a SSH key you can't access your machine. Thus add an SSH key, e.g. use your `~/.ssh/id_rsa.pub`. If you don't have a key on your machine yet, create one with `ssh-keygen`.

## Add the key

```hcl-terraform
resource "aws_key_pair" "my_key" {
  // ...
}
```

Use your initials as your key name.

Now you can plan and apply the changes.

## SSH into it

To know which IP you have to use for SSH, add an output `public_ip` with the public IP from the instance.

```hcl-terraform
output "public_ip" {
  // ...
}
```

Then you should be able to SSH into `ubuntu@<public-ip>`. You should :smirk:

### Add a security group

To access the server via SSH from outside AWS add your own security group and use the security group `name` in the `security_groups` array of your instance.

```hcl-terraform
resource "aws_security_group" "my_security_group" {
  name_prefix = "my_security_group"

  // SSH inbound
  ingress {
    // ...
  }

  // inbound all within security group
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  // outbound all
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  // ...
}
```

Tag it with your initials as `Name`.

## Troubleshooting

If you messed up you can save your work and either checkout the previous step to start again or checkout the next step to follow along:

```bash
# preserve your work
git add .
git commit -m "Saving my work from Step 02"
git branch 02-wip

# reset back to the previous step
git reset --hard 01-solution

# or get back on track with the next step to follow along
git reset --hard 02-solution
```
