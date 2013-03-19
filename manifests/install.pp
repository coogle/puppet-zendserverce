class zendserverce::install($php_version = "5.3") {

    # https://github.com/puppetlabs/puppetlabs-stdlib
  file_line { 'zendserverce::debian_package':
      path => '/etc/apt/sources.list',
      
      /* This is a special repository specifically for Ubuntu 12.04 which we also need for 12.10 due to a ZSCE bug */
      line => 'deb http://repos.zend.com/zend-server/6.0/deb server non-free'
  }

  exec { "zendserverce::zend_key":
    command => "wget http://repos.zend.com/zend.key -O - |apt-key add -"
  }

  exec { "zendserverce::apt_update":
    command => "/usr/bin/apt-get update",
    require => [
      File_line['zendserverce::debian_package'],
      Exec["zendserverce::zend_key"]
    ],
  }

  package { "zend-server-php-$php_version":
       ensure => "latest",
       require  => Exec["zendserverce::apt_update"]
  }
  
  package { "php-5.3-extra-extensions-zend-server":
     ensure => "latest",
     require => [ Exec['zendserverce::apt_update'], Package["zend-server-ce-php-$php_version"] ] 
  }
}