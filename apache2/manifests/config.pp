# Submodulo config de apache2
class apache2::config {
  $apache_dir         = '/etc/apache2'
  $apache_docroot     = '/var/www'
  $apache_htmlroot    = "${apache_docroot}/html"
  $apache_errorroot  = "${apache_docroot}/html_error"
  file {'apache2.conf':
    ensure => file,
    path   => "${apache_dir}/apache2.conf",
    notify => Service['apache2'],
    source => "puppet:///modules/${module_name}/apache2.conf",
  }
  file {'index.html':
    ensure => file,
    mode   => '0644',
    path   => "${apache_htmlroot}/index.html",
    source => "puppet:///modules/${module_name}/index.html",
  }
  file {'404.html':
    ensure  => file,
    mode    => '0644',
    path    => "${apache_errorroot}/404.html",
    source  => "puppet:///modules/${module_name}/404.html",
    require => File['errorhtml'],
  }
  file {'errorhtml':
    ensure => directory,
    mode   => '0775',
    path   => $apache_errorroot,
  }
}
