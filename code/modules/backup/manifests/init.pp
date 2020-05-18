class backup {
	file { '~/backup.sh':
		ensure => present,
		source_permissions => 'ignore',
		owner => 'root',
		group => 'root',
		mode => '0766',
		source => 'puppet:///modules/backup/backup.sh'
	}
}