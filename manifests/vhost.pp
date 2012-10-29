define zendserverce::vhost(
  $server_name='www.example.com',
  $docroot_all='/var/www',
  $template='zendserverce/vhost.conf.erb',
  $port='80',
  $serveraliases='',

) {

  $docroot = "${docroot_all}/${server_name}"

  file {"/usr/local/zend/etc/sites.d/vhost_${server_name}.conf":
    content => template($template),
    owner => 'root',
    group => 'zend',
    mode => '755',
    require => [
      Class["zendserverce::install"]
    ],
    notify => Class["zendserverce::service"],
  }
}