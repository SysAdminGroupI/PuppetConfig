class owncloud::config {
	exec { 'wget -nv https://download.owncloud.org/download/repositories/production/Ubuntu_19.10/Release.key -O Release.key':
		user => 'root',
		creates => '/home/student/Release.key',
		path => [ '/bin/','/sbin/','/usr/bin/','/usr/sbin/' ],
	}
	
	exec { 'apt-key add - < Release.key':
		user => 'root',
		creates => '/home/student/Release.key',
		path => [ '/bin/','/sbin/','/usr/bin/','/usr/sbin/' ],
		require => Exec['wget -nv https://download.owncloud.org/download/repositories/production/Ubuntu_19.10/Release.key -O Release.key'],
	}
	
	file { "/etc/apt/sources.list.d/owncloud.list":
		ensure => present,
		source_permissions => 'ignore',
		source => 'puppet:///modules/owncloud/owncloud.list',
		mode => '0660',
		owner => 'root',
		group => 'root',
	}
	
	file { '/etc/apache2/conf-available/ssl-params.conf':
		ensure => present,
		source_permissions => 'ignore',
		source => 'puppet:///modules/owncloud/ssl-params.conf',
		mode => '0664',
		owner => 'root',
		group => 'root',
	}
	
	file { '/etc/apache2/sites-enabled/000-default.conf':
		ensure => present,
		source_permissions => 'ignore',
		source => 'puppet:///modules/owncloud/000-default.conf',
		mode => '0777',
		owner => 'root',
		group => 'root',
	}
	
	file { '/etc/apache2/sites-enabled/default-ssl.conf':
		ensure => present,
		source_permissions => 'ignore',
		source => 'puppet:///modules/owncloud/default-ssl.conf',
		mode => '0777',
		owner => 'root',
		group => 'root',
	}
}
