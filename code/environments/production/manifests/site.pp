node 'mgmt-i.foo.org.nz' {
	include nagios
	package {
		'vim': ensure => present,
		'libwww-perl': ensure => present,
		'libcrypt-ssleay-perl': ensure => present,
	}
}

node 'db-i.foo.org.nz' {
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
	include sudo
	include ntp_service
	include puppetconf
	include userconf
	include nrpe
	package {
		'vim': ensure => present
	}
}

node 'back-i.foo.org.nz' {
	include sudo
	include ntp_service  
	include puppetconf
	include userconf
	include nrpe
	package {
		'vim': ensure => present
	}
}
