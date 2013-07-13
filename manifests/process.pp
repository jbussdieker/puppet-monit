define monit::process(
  $ensure="running",
  $pidfile = '',
  $start_command,
  $stop_command) {

  include monit

  file {"/etc/monit/conf.d/${name}":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    content => template('monit/process.erb'),
    notify  => Class['monit::service'],
  }

  exec {"monit_#{name}":
    command     => "/usr/bin/monit restart ${name}",
    refreshonly => true,
  }

}
