class owncloud::config {
	file { "/etc/apt/sources.list.d/owncloud.list":
		ensure => present,
		source_permissions => 'ignore',
		source => 'puppet:///modules/owncloud/owncloud.list',
		mode => '0660',
		owner => 'root',
		group => 'root',
	}
}
