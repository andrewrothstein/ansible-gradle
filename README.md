vmichel95.gradle
=========
![Build Status](https://github.com/andrewrothstein/ansible-gradle/actions/workflows/build.yml/badge.svg)


Install [gradle](https://gradle.org/)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

> Note: If gradle_installer is toggled between Homebrew (brew) and archived binary (bin) mode, please make sure the executable is re-linked if you want to leverage the Homebrew version: `brew unlink gradle && brew link gradle`

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.gradle
```

License
-------

MIT

Author Information
------------------

Victor Michel <victormichel95@gmail.com>
Andrew Rothstein <andrew.rothstein@gmail.com>
