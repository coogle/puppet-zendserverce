class zendserverce::config {
  file { "/usr/local/zend/etc/php.ini" :
    source => "puppet:///zendserverce/php.ini",
    mode => 644,
    owner => root,
    group => zend,
    notify => [ Class['zendserverce::service'] ]
  }
}