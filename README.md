puppet-rssh
===========

[![Build Status](https://travis-ci.org/blom/puppet-rssh.png)](https://travis-ci.org/blom/puppet-rssh)

* [Homepage](https://github.com/blom/puppet-rssh)
* [Puppet Forge](https://forge.puppetlabs.com/blom/rssh)

Puppet module for [rssh][1].

Installation
------------

    puppet module install blom/rssh

Usage
-----

    class { 'rssh':
    }

Takes the following optional attributes:

* `package`: Package name (default: `rssh`).
* `config_file`: Configuration file path (default: `/etc/rssh.conf`).
* `config_mode`: Configuration file mode (default: `0644`).
* `allow`: Allowed commands (default `[]`).
* `umask`: umask value for scp and sftp (default: `022`).
* `logfacility`: Syslog facility that rssh logs to (default: `LOG_USER`).
* `chrootpath`: `chroot()` path for users (default: `false`).
* `users`: Options for specific users (default: `[]`).

`allow` takes an array:

    allow => ['scp', 'sftp', 'cvs', 'rdist', 'rsync', 'svnserve']

As does `users`:

    users => ['foo:011:000100', 'bar:011:000100']

See [`rssh.conf(5)`][2] for more information.

[1]: http://www.pizzashack.org/rssh/
[2]: http://manpages.ubuntu.com/manpages/en/man5/rssh.conf.5.html
