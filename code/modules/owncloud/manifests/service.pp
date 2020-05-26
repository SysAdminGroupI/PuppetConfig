class owncloud::service {
	service { 'apache2':
		ensure => 'running',
		enable => 'true',
		subscribe => Class['owncloud::config'],
	}
}
