node 'mgmt-i.foo.org.nz' {
	include ufw
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

	ufw::allow { 'ssh':
		port => '22',
	}

	ufw::allow { 'puppet':
		port => '8140',
	}

	ufw::allow { 'http':
		port => '80',
	}

	ufw::allow { 'https':
		port => '443',
	}
}

node 'db-i.foo.org.nz' {
	include ufw
	include cron
	include sudo
	include ntp_service
	include mariadb
	include puppetconf
	include userconf
	include nrpe
	package { 'vim': 
		ensure => present,
	}

	ufw::allow { 'ssh':
		port => '22',
	}

	ufw::allow { 'mysql':
		port => '3306',
	}

	ufw::allow { 'nrpe':
		port => '5666',
		from => '10.25.138.148',
	}
}

node 'app-i.foo.org.nz' {
	include ufw
	include cron
	include sudo
	include ntp_service
	include puppetconf
	include userconf
	include nrpe
	include owncloud
	package { 'vim': 
		ensure => present,
	}

	ufw::allow { 'ssh':
		port => '22',
	}

	ufw::allow { 'http':
		port => '80',
	}

	ufw::allow { 'https':
		port => '443',
	}

	ufw::allow { 'nrpe':
		port => '5666',
		from => '10.25.138.148',
	}
}

node 'back-i.foo.org.nz' {
	include ufw
	include cron
	include sudo
	include ntp_service  
	include puppetconf
	include userconf
	include nrpe
	package { 'vim': 
		ensure => present,
	}

	ufw::allow { 'ssh':
		port => '22',
	}

	ufw::allow { 'nrpe':
		port => '5666',
		from => '10.25.138.148',
	}
}
