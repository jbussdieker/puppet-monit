define monit::remoteservice (
  $address = "127.0.0.1",
  $port = '80', 
  $protocol = 'tcp'){

  include monit

  file {"/etc/monit.d/${name}":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    content => template('monit/remoteservice.erb'),
    notify  => Class['monit::service'],
    require => Class['monit::package'],
  }

}

