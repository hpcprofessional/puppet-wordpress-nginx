if $::osfamily == 'Windows' {
  Package {
    provider => chocolatey,
  }
}

# Windows path: C:/ProgramData/nginx
file { '/var/www':
  ensure => directory,
}

# Windows path: C:/ProgramData/nginx/html
class { 'nginx':
  root => '/var/www/html',
}
