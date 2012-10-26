class zendserverce::config {
  file { "/usr/local/zend/etc/php.ini" :
    source => "puppet:///zendserverce/php.ini",
    mode => 644,
    owner => root,
    group => zend,
    require => [ Class['zendserverce::install'] ],
    notify => [ Class['zendserverce::service'] ]
  }
}