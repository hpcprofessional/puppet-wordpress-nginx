class profile::wordpress {

  class { 'mysql::server':
    root_password => 'puppetlabs',
  }
  class {'mysql::bindings':
    php_enable => true,
  }

  package { "php-fpm" :
    ensure => present,
  }
  service { "php-fpm" :
    ensure => running,
    require => Package['nginx'],
  }
  file { "/etc/php-fpm.d/www.conf" : 
    ensure => file,
    source => "puppet:///modules/profile/www.conf",
    notify => Service['php-fpm'],
  }

  include nginx

  include ::wordpress

    nginx::vhost { "wordpress.puppetlabs.vm":
      docroot            => $::wordpress::install_dir,
    }

}
