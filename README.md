# my-ansible
Ansible orchestration of my web development environment

# ansible roles
- [EHER.git](https://github.com/EHER/ansible-git)
- [EHER.mysql](https://github.com/EHER/ansible-mysql)
- [EHER.package_client](https://github.com/EHER/ansible-package_client)
- [EHER.package_server](https://github.com/EHER/ansible-package_server)
- [EHER.web](https://github.com/EHER/ansible-web)

# Installation
Clone the repository
```bash
git clone git://github.com/EHER/my-ansible.git
cd my-ansible
```

Use pip to install dependencies (virtualenv is also recommended)
```bash
pip install -r dependencies.txt
```

Install aditional ansible roles
```
ansible-galaxy install -fr ROLES_FILE
```

# Configuration
Configure you remote user and where are your private key
```bash
vim ansible.cfg
```

```
# ansible.cfg
[defaults]
hostfile = hosts
roles_path = roles
roles_file = ROLES_FILE
module_name = command
remote_user = vagrant
private_key_file = ~/.vagrant.d/insecure_private_key
```

Add your machines to hosts file:
```bash
vim hosts
```

```
# hosts
[mysql]
192.168.56.101

[git]
192.168.56.101

[package_client]
192.168.56.101

[package_server]
192.168.56.101

[web]
192.168.56.101
```

Then test your configuration
```bash
ansible all -m ping
```

# Using

Take a look at site.yml
```bash
vim site.yml
```

And run the playbook
```bash
ansible-playbook site.yml
```

You can also run just some part of the playbook usig tags
```bash
ansible-playbook site.yml --tags git
```

# Useful Commands

Add your private key to git user
```bash
cat ~/.ssh/id_rsa.pub >> files/authorized_keys
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

