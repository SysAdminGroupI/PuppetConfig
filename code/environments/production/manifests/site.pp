node 'mgmt-i.foo.org.nz' {
	include nagios
	include cron
	package { 'vim': 
		ensure => present,
	}
	
	package { 'libwww-perl': 
		ensure => present,
	}
	
	package { 'libcrypt-ssleay-perl': 
		ensure => present,
	}
}

node 'db-i.foo.org.nz' {
	include cron
	include sudo
	include ntp_service
	include mariadb
	include puppetconf
	include userconf
	include nrpe
	package {
		'vim': ensure => present
	}
}

node 'app-i.foo.org.nz' {
	include cron
	include sudo
	include ntp_service
	include puppetconf
	include userconf
	include nrpe
	include owncloud
	package {
		'vim': ensure => present
	}
}

node 'back-i.foo.org.nz' {
	include cron
	include sudo
	include ntp_service  
	include puppetconf
	include userconf
	include nrpe
	package {
		'vim': ensure => present
	}
}
