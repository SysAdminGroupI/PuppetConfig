class owncloud::config {
	exec { 'download owncloud realese key':
		command => 'wget -nv https://download.owncloud.org/download/repositories/production/Ubuntu_19.10/Release.key -O Release.key',
		user => 'root',
		creates => '~/Release.key',
		path => ['~/'],
	}
	
	file { "/etc/apt/sources.list.d/owncloud.list":
		ensure => present,
		source_permissions => 'ignore',
		source => 'puppet:///modules/owncloud/owncloud.list',
		mode => '0660',
		owner => 'root',
		group => 'root',
	}
}
