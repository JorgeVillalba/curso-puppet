# Modulo agrupado de NTP
class ntp {
  case $::operatingsystem {
    redhat, centos: {
      $service_name = 'ntp'
      $conf_file    = 'ntp.conf.el'
    }
    debian, ubuntu: {
      $service_name = 'ntp'
      $conf_file    = 'ntp.conf.debian'
    }
    default: {
      $service_name = 'ntp'
      $conf_file    = 'ntp.conf.default'
    }
  }
  package {'ntp':
    ensure => installed,
  }
  file {'/etc/ntp.conf':
    ensure  => file,
    require => Package['ntp'],
    #source   => "/media/curso/B896-94C3/learning-manifests/${conf_file}"
    source  => "puppet:///modules/ntp/${conf_file}"
  }
  service {'ntpd':
    ensure    => running,
    name      => $service_name,
    enable    => true,
    subscribe => File['/etc/ntp.conf'],
  }
}

#class {'ntp': }
