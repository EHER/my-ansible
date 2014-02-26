# my-ansible
Ansible orchestration of php web servers

# Installation
Clone the repository
```bash
git clone git://github.com/EHER/my-ansible.git
cd my-ansible
```


Use pip to install dependencies (virtualenv is also recommended)
```bash
pip install -r deps.txt
```

# Configuration
Configure you remote user and where are your private key
```bash
vim ansible.cfg
```

```
[defaults]
hostfile = ./hosts
module_name = command
#remote_user = ubuntu
#private_key_file = /where/hell/are/your/key.pem
```

Add your machines to hosts file:
```bash
vim hosts
```

```
[web]
my-aws-host-or-something-like-this.com
other-host.com

[package]
my-aws-host-or-something-like-this.com

[git]
my-aws-host-or-something-like-this.com
my-git-host.whatever.com
```

Then test your configuration
```bash
ansible all -m ping
```

# Using
Just run the main playbook
```bash
ansible-playbook site.yml
```

# Useful Commands

Add your private key to git user
```bash
cat ~/.ssh/id_rsa.pub > files/home/git/.ssh/authorized_keys
```

Get Vagrant private_key_file
```bash
vagrant ssh-config | grep IdentityFile  | awk '{print $2}'
```

Get Vagrant remote_user
```bash
vagrant ssh-config | grep 'User ' | awk '{print $2}'
```

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/EHER/my-ansible/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

