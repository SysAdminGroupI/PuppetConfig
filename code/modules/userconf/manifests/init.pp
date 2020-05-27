class userconf {
	user { 'nobody':
		name => 'nobody',
		ensure => 'present',
		gid => 'nogroup',
		home => '/home/nonexistent',
		shell => '/usr/sbin/nologin',
		require => Group['nogroup']
	}

	group { 'nogroup':
		ensure => 'present'
	}

	user { 'student':
		name => 'student',
		ensure => 'present',
		gid => 'student',
		home => '/home/student',
		shell => '/bin/bash',
		require => Group['student']
	}

	group { 'student':
		ensure => 'present'
	}

	user { 'manager':
		name => 'manager',
		ensure => 'present',
		gid => 'manager',
		home => '/home/manager/',
		shell => '/bin/bash',
		require => Group['manager']
	}

	group { 'manager':
		ensure => 'present'
	}
}
