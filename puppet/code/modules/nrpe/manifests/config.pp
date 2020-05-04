class nrpe::config {
	file { "/etc/nagios/nrpe.cfg":
		ensure => present,
		source_permissions => 'ignore',
		source => 'puppet:///modules/nrpe/nrpe.cfg',
		mode => '0444',
		owner => 'root',
		group => 'root',
		require => Class["nrpe::install"],
		notify => Class["nrpe::service"] 
	}
}
