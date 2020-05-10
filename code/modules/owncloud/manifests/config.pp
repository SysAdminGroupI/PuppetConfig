class owncloud::config {
	file { "/etc/apt/sources.list.d/owncloud.list":
		ensure => directory,
		mode => '0775',
		owner => 'root',
		group => 'root',
	}
}
