# package_server
A service to pack projects from git repositories into deb packages, and make then availabe as a debian channel (to install with apt-get).

## variables
- eher_package_server_host - host that the debian channel will be availabe
- eher_package_server_port - port that the debian channel will listen
- eher_package_server_build_path - path used to build projects
- eher_package_server_name - name of the generated deb package
- eher_package_server_git_repo - git repository that have the project to be packed

## how it works?

