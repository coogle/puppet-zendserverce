class zendserverce::config {
  file { "/usr/local/zend/etc/php.ini" :
    source => "puppet:///zendserverce/usr/local/zend/etc/php.ini",
    mode => 644,
    owner => root,
    group => zend,
    require => [ Class['zendserverce::install'] ],
    notify => [ Class['zendserverce::service'] ]
  }
  
  file { "/usr/local/zend/etc/jqd.ini" :
    source => "puppet:///zendserverce/usr/local/zend/etc/jqd.ini",
    mode => 644,
    owner => root,
    group => zend,
    require => [ Class['zendserverce::install'] ],
    notify => [ Class['zendserverce::service'] ]
  }
  
  file { "/usr/local/zend/etc/conf.d/jobqueue.ini" :
    source => "puppet:///zendserverce/usr/local/zend/etc/conf.d/jobqueue.ini",
    mode => 644,
    owner => root,
    group => zend,
    require => [ Class['zendserverce::install'] ],
    notify => [ Class['zendserverce::service'] ]
  }
  
  file { "/usr/local/zend/etc/conf.d/mongo.ini" :
    source => "puppet:///zendserverce/usr/local/zend/etc/conf.d/mongo.ini",
    mode => 644,
    owner => root,
    group => zend,
    require => [ Class['zendserverce::install'] ],
    notify => [ Class['zendserverce::service'] ]
  }
  
  file { "/usr/local/zend/etc/conf.d/curl.ini" :
    source => "puppet:///zendserverce/usr/local/zend/etc/conf.d/curl.ini",
    mode => 644,
    owner => root,
    group => zend,
    require => [ Class['zendserverce::install'] ],
    notify => [ Class['zendserverce::service'] ]
  }
  
  file { "/usr/local/zend/gui/lighttpd/etc/conf.d/jobqueue.ini" :
    source => "puppet:///zendserverce/gui/lighttpd/etc/conf.d/jobqueue.ini",
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
  
  file { "/usr/local/bin/pecl":
    ensure => "link",
    target => "/usr/local/zend/bin/pecl",
    require => [ Class['zendserverce::install'] ]
  }
}