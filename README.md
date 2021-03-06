# my-ansible
Ansible orchestration of my web development environment

```
+--------------------+   +--------------------+   +--------------------+
|                    |   |                    |   |                    |
|       mysql        |   |   package_server   |   |        web         |
|                    |   |                    |   |                    |
+--------------------+   +--------------------+   +--------------------+
```

# ansible roles
- [EHER.duplicity_backup](https://github.com/EHER/ansible-duplicity_backup)
- [EHER.git](https://github.com/EHER/ansible-git)
- [EHER.mysql](https://github.com/EHER/ansible-mysql)
- [EHER.mysql_snapshot](https://github.com/EHER/ansible-mysql_snapshot)
- [EHER.package_client](https://github.com/EHER/ansible-package_client)
- [EHER.package_server](https://github.com/EHER/ansible-package_server)
- [EHER.web](https://github.com/EHER/ansible-web)
- [markchristophercooper.automysqlbackup](https://githu.com/markchristophercooper.automysqlbackup)

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
Use the current vagrant configuration to power up a new virtual machine
```bash
vagrant up
```

Or add your own configurations into ansible.cfg and hosts file.

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

[package_server]
192.168.56.101

[web]
192.168.56.101
```

Use the ping module to test your configuration
```bash
ansible all -m ping
```

# Using

Run the main playbook
```bash
ansible-playbook site.yml
```

You can also run just some part of the playbook usig tags
```bash
ansible-playbook site.yml --tags web
```

To deploy web projects to the latest version run the deploy playbook
```bash
ansible-playbook deploy.yml
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
