# Step 03 - Resolve dynamic data

## Get the AMI from data

To don't update the AMI ID every time, retrieve it via a data object instead.

```hcl-terraform
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
```

## Troubleshooting

If you messed up you can save your work and either checkout the previous step to start again or checkout the next step to follow along:

```bash
# preserve your work
git add .
git commit -m "Saving my work from Step 03"
git branch 03-wip

# reset back to the previous step
git reset --hard 02-solution

# or get back on track with the next step to follow along
git reset --hard 03-solution
```
