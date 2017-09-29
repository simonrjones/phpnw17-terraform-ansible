# Setup Instructions

To work through the DevOps for Developers workshop with Terraform and Ansible you need a little setup beside the usual LAMP stack.

Please make sure you have prepared your notebook, which you bring to the workshop accordingly and created the needed accounts.

## Software

### Operating System

Ansible runs only on Linux (and Mac OSX), please ensure your notebook is either running Linux (I use Ubuntu) or have a Virtual Machine with Linux running (e.g. Virtualbox with Ubuntu 16.04 as guest).

You can also use your Mac OSX, but I never used Ansible/Terraform on Mac, so use it on your own risk. I may help you with the most errors, but I can't guarantee that.

### Terraform

Installing Terraform is simple. Download it from https://www.terraform.io/downloads.html, extract the binary and put it into your `$PATH` (e.g. `~/bin/`).

```bash
wget https://releases.hashicorp.com/terraform/0.10.6/terraform_0.10.6_linux_amd64.zip
unzip terraform_0.10.6_linux_amd64.zip
mv terraform ~/bin/
```

Quickly validate it's installed:

```bash
$ terraform version
Terraform v0.10.6
```

### Ansible

To install Ansible please consult the documentation at http://docs.ansible.com/ansible/latest/intro_installation.html

Please install the latest release and preferable by your systems package manager. For Ubuntu this would be the following:

```bash
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```

Quickly validate it's installed:

```bash
$ ansible --version
ansible 2.4.0.0
  config file = /etc/ansible/ansible.cfg
  configured module search path = Default w/o overrides
  [..snip..]
```

## Accounts

### Amazon Web Services

In this workshop we will use extensively Amazon Web Services (AWS) as infrastructure provider. We will use it within in the free tier, so it's best to register for a new account on https://aws.amazon.com/de/free/. Although with the free tier no costs should incur, you need to have a credit card on hand.

You still can use your existing account if you have one, but make sure it's not a production account or something like this. Only use an existing development account. The default VPCs and default subnets must be present and must not be deleted. 

If you can't create an AWS account (because you don't have a credit card or of other reasons), I will provide you with access credentials to a dedicated account from us. Those will be revoked immediately after the workshop, so please try to create your own AWS account if you want to experience with the workshop learnings later at home.

### DNSimple

In one part of the workshop, we will use [DNSimple](https://dnsimple.com/r/48cc3d40126b11) too. Don't worry, you get the access credentials from me to use it.

However, if you have already a [DNSimple](https://dnsimple.com/r/48cc3d40126b11) account and want to use that (or want to [create your own one](https://dnsimple.com/r/48cc3d40126b11)), please obtain an [account level API v2 token](https://support.dnsimple.com/articles/api-access-token/) for the workshop

## IDE Support

### Jetbrains based IDEs

For IDE support on e.g. PhpStorm you can install the following plugins:

- HashiCorp Terraform / HCL language support
