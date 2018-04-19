Ansible-Pypy ![](https://secure.travis-ci.org/wangwenpei/ansible-pypy.png?branch=master)
========================================================================================

Install Portable PyPy for Linux.
This Role is inspiring from [defunctzombie.coreos-bootstrap](https://github.com/defunctzombie/ansible-coreos-bootstrap)

Install
-------

```
ansible-galaxy install wangwenpei.pypy
```

Role Variables
--------------

```
pypy_bin_path: ~/.bin
pypy_home: ~/.portable-pypy
pypy_version: 3.5-5.10.1
pypy_arch: linux_x86_64-portable
pypy_mirror: https://bitbucket.org/squeaky/portable-pypy/downloads
```


Example Playbook
----------------

For target machine

```
    - hosts: servers
      roles:
        - wangwenpei.pypy
```


License
-------

MIT

Author Information
------------------

Author: wangwenpei
