class metrics {
  file { '/opt/metrics3/': 
    ensure => directory,
    mode   => 750,
    owner  => root,
    group  => root,
  }
  file { '/opt/metrics/metrics.sh' :
    ensure => file,
    mode   => 750,
    source => 'puppet://modules/sudo/metrics.sh',
    owner  => root,
    group  => root,
  }

}

