class monit(
  $interval = 120,
) {

  class {'monit::package':
    notify  => Class['monit::service'],
  }

  class {'monit::config':
    interval => $interval,
    notify   => Class['monit::service'],
    require  => Class['monit::package'],
  }

  class {'monit::service':
    require => Class['monit::config'],
  }

}
