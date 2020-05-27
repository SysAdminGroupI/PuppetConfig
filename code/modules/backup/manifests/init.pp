class backup {
	file { '/home/student/backup.sh':
		ensure => present,
		source_permissions => 'ignore',
		owner => 'student',
		group => 'student',
		mode => '0766',
		source => 'puppet:///modules/backup/backup.sh'
	}



}
