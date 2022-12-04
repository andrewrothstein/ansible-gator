andrewrothstein.gator
=========

![Build Status](https://github.com/andrewrothstein/ansible-gator/actions/workflows/build.yml/badge.svg)

Installs [gator](https://github.com/open-policy-agent/gatekeeper/releases).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.gator
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
