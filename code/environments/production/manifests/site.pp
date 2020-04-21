node 'db-i.foo.org.nz'{
 include sudo
 include ntp_service
 include mariadb
 include puppetconf
 include userconf
 include nagios
 package {
  'vim': ensure => present
 }
}

node 'app-i.foo.org.nz'{
 include sudo
 include ntp_service
 include puppetconf
 include userconf
 include nagios
 package {
  'vim': ensure => present
 }
}

node 'back-i.foo.org.nz'{
 include sudo
 include ntp_service  
 include puppetconf
 include userconf
 include nagios
 package {
  'vim': ensure => present
 }
}
