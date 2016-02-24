# Submodulo install de apache2
class apache2::install{
  package {'apache2':
    ensure => installed,
  }
}
