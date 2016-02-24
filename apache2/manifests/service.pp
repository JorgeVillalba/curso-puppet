# Submodulo service de apache2
class apache2::service {
  service {'apache2':
    ensure    => running,
    require   => Package['apache2'],
    subscribe => File['apache2.conf'],
  }
}
