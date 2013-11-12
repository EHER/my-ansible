# my-ansible
My Servers' configurations using Ansible

# Installation
Clone the repository
```bash
git clone git://github.com/EHER/my-ansible.git
cd my-ansible
```


You should use pip to install dependencies (virtualenv is recommended)
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
[webservers]
my-aws-host-or-something-like-this.com
other-host.com
```

Then test your configuration
```bash
ansible all -m ping
```

# Using
Just run the playbook
```bash
ansible-playbook playbook.yml
```


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/EHER/my-ansible/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

