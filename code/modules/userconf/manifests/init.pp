class userconf {



user { 'nobody':
	name => 'nobody',
	ensure => 'present',
	gid => 'testgroup',
	home => '/home/nonexistent',
	shell => '/usr/sbin/nologin',
	require => Group['othergroup']
}
group{'othergroup':
	ensure => 'present'

}
user {'student':
	name => 'student',
	ensure => 'present',
	gid => 'studentgroup',
	home => '/home/student',
	shell => '/bin/bash',
	require => Group['studentgroup']
}
group {'studentgroup':
	ensure => 'present'
}
user {'manager':
	name => 'manager',
	ensure => 'present',
	gid => 'managergroup',
	home => '/home/manager/',
	shell => 'bin/bash',
	require => Group['managergroup']
}
group {'managergroup':
	ensure => 'present'
}
}
