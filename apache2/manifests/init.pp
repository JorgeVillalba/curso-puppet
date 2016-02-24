# Modulo apache2
class apache2 {
  include ::apache2::install
  include ::apache2::config
  include ::apache2::service
  Class[::Apache2::Install] ->
  Class[::Apache2::Config] ->
  Class[::Apache2::Service]
}
