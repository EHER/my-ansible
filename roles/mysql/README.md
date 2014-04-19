# mysql
It is a role to install mysql, create database, user and handle privilleges.

## variables
- eher_mysql_db - name of the database that will be created
- eher_mysql_user - user name that will have full privilleges on database

## how it works?

The role is as simple as give a database name and a owner username.
```yml
---
  roles:
      - role: mysql
        eher_mysql_db: 'eher'
        eher_mysql_user: 'blog_eher'
```

A file will be created locally to store the generated password.
```bash
cat credentials/mysql/eher/blog_eher_password
```

Changing that file will make the ansible update passwords on next run.

The root password is also stored in that format.
```bash
cat credentials/mysql/root_password
```

As a bonus, the root user of the server can login without type password.
```bash
mysqldump --all-databases > /root/mysql/backup.sql
```

## security warning

As you can see the passwords are stored locally in plain text and on the server into root home (with root permission). That isn't a cleaver thing to do into a production server. Make sure that you are using this rule into machines that can be destroyed anytime.

If you wanna improve the role security, i recommend you to take a look on [Ansible Vault](http://docs.ansible.com/playbooks_vault.html) to keep encrypted files.
