class nagios::install {
	package{ "nagios3":
		ensure => present,
	}
	
	package{ "nagios-nrpe-plugin":
		ensure => present,
	}

	user{ "nagios":
		ensure => present,
	}

	group{ "nagios":
		ensure => present,
	}
}
