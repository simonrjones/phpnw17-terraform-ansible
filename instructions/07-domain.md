# Step 07 - Add a domain

We can add a domain to DNSimple.

## Configure the provider

Add the following provider:

```hcl-terraform
provider "dnsimple" {
  account = "75963"
}
```

Export the account API token on the shell, the DNSimple provider sadly has not a mechanism like AWS.

```bash
$ export DNSIMPLE_TOKEN=atoken
```

### configure the domain

Configure the domain, like you used in the webserver config. Replace foo with your initials:

```hcl-terraform
resource "dnsimple_record" "bolt" {
  domain = "${var.base_domain}"
  name   = "bolt-foo"
  // ...
}
```

The `base_domain` variable should contain `phpnw17.karis.ch` or your domain if you use a custom DNSimple account.

## Troubleshooting

If you messed up you can save your work and either checkout the previous step to start again or checkout the next step to follow along:

```bash
# preserve your work
git add .
git commit -m "Saving my work from Step 07"
git branch 07-wip

# reset back to the previous step
git reset --hard 06-solution

# or get back on track with the next step to follow along
git reset --hard 07-solution
```
