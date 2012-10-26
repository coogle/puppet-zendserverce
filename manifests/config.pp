class zendserverce::config {
  file { "/usr/local/zend/etc/php.ini" :
    source => "puppet:///zendserverce/php.ini",
    mode => 644,
    owner => root,
    group => zend,
    require => [ Class['zendserverce::install'] ],
    notify => [ Class['zendserverce::service'] ]
  }
  
  file { "/usr/local/bin/php":
    ensure => 'link',
    target => '/usr/local/zend/bin/php',
    require => [ Class['zendserverce::install'] ]
  }
  
  file { "/usr/local/bin/phpize":
    ensure => 'link',
    target => '/usr/local/zend/bin/phpize',
    require => [ Class['zendserverce::install'] ]
  }
  
  file { "/usr/local/bin/php-config":
    ensure => 'link',
    target => '/usr/local/zend/bin/php-config',
    require => [ Class['zendserverce::install'] ]
  }
}