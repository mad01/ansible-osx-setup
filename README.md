### Ansible plays to install a mac

### Pre ansible install
A full install of Xcode is needed and have to be installed 

How to use. 
```sh
$ ./setup.sh
```

The vim play will compile the YCM which takes some time and i have no check to see if YCM is installed for that reason that play is not it the site.yml play. 
```sh
$ ansible-playbook -i hosts vim.yml
```
