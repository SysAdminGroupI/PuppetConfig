class nagios::service{
	service {"nagios3":
		ensure => running,
		enable => true,
}
}
