class owncloud::config {
	file { "/etc/apt/sources.list.d/owncloud.list":
		ensure => present,
		mode => '0775',
		owner => 'root',
		group => 'root',
	}
}
