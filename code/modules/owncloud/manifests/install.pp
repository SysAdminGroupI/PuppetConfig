class owncloud::install {
	package{ "php-bz2":
		ensure => present,
	}
	
	package{ "php-curl":
		ensure => present,
	}
	
	package{ "php-gd":
		ensure => present,
	}
	
	package{ "php-imagick":
		ensure => present,
	}
	
	package{ "php-intl":
		ensure => present,
	}
	
	package{ "php-mbstring":
		ensure => present,
	}
	
	package{ "php-xml":
		ensure => present,
	}
	
	package{ "php-zip":
		ensure => present,
	}
	
	package{ "owncloud-files":
		ensure => present,
		require => Class["owncloud::config"],
	}
}
