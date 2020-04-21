class nagios::install {
	package{"nagios3":
		ensure => present,
}
	user{"nagios":
		ensure => present,
}
	group {"nagios":
		ensure => present,
}
}
