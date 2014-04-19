# package_client
A role to install packages from your own software channel.

## variables
- eher_package_client_host - host of your software channel will be available
- eher_package_client_port - port of your software channel will listen
- eher_package_client_name - name of the deb package to be installed

## how it works?

Fisrt of all configure the basic of your software channel.
```yml
---
# group_vars/package_client
eher_package_client_host: localhost
eher_package_client_port: 80
```

Then you just pass the name of the package.
```yml
---
# site.yml
- hosts: package_client
  sudo: yes
  tags: package_client
  roles:
      - role: package_client
        eher_package_name: 'queroservoluntario'
```

The role will ensure that software channel is configured, the apt cache is updated and the last package version is installed.

Your can use the package_server role to create your own software channel.
