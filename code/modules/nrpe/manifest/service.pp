class nrpe::service{
	service { "nagios-nrpe-server":
		ensure => running,
		enable => true,
	}
}
