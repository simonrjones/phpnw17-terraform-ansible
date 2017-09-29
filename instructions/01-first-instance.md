# Step 01 - Your first instance

## The provider

Configure the AWS provider with credentials from the `phpnw17` profile in `~/.aws/credentials`.

```hcl-terraform
provider "aws" {
  // ...
}
```

Use a variable for the region and `eu-west-2` (London) as your default region.

## Add your first instance

Create a `t2.micro` instance and tag it with your initials as `Name`.

```hcl-terraform
resource "aws_instance" "my_instance" {
  // ...
}
```

As AMI ID use `ami-e1f2e185` (Ubuntu 16.04 LTS in eu-west-2).

Before you plan and apply the changes, init the provider with `terraform init`.

## Bonus: Makefile

If you use Terraform within a software project (as we do with Bolt), it becomes tedious to change into the correct directory. So you can create a `Makefile` to run Terraform from the project root.

## Addendum: File layout

Put your files into `provisioning/terraform`. Split your terraform configuration over multiple files:

* `main.tf`: The main file which contains your resource definitions
* `provider.tf`: This file contains your provider configuration
* `variables.tf`: Put all your variable definitions together with defaults and descriptions into this file.

## Troubleshooting

If you messed up you can save your work and either checkout the previous step to start again or checkout the next step to follow along:

```bash
# preserve your work
git add .
git commit -m "Saving my work from Step 01"
git branch 01-wip

# reset back to the previous step
git reset --hard 00-start

# or get back on track with the next step to follow along
git reset --hard 01-solution
```
