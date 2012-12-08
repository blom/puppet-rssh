# Installs and configures rssh.
class rssh(
  $package     = 'rssh',
  $config_file = '/etc/rssh.conf',
  $config_mode = '0644',
  $allow       = [],
  $umask       = '022',
  $logfacility = 'LOG_USER',
  $chrootpath  = false,
  $users       = [],
) {
  package { $package:
    ensure => installed,
  }

  file { $config_file:
    ensure  => present,
    mode    => $config_mode,
    content => template('rssh/rssh.conf.erb'),
  }
}
