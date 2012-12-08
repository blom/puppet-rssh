puppet-rssh
===========

Puppet module for installing and configuring [rssh][1].

Usage
-----

    class { 'rssh': }

Defined parameters and their defaults:

    package      'rssh'
    config_file  '/etc/rssh.conf'
    config_mode  '0644'
    allow        []
    umask        '022'
    logfacility  'LOG_USER'
    chrootpath   false
    users        []

`allow` takes an array:

    allow => [ 'scp', 'sftp', 'cvs', 'rdist', 'rsync', 'svnserve' ]

As does `users`:

    users => [ 'foo:011:000100', 'bar:011:000100' ]

See `rssh.conf(5)` for more information.

[1]: http://www.pizzashack.org/rssh/
