class nagios::config
{
	# Managed Files

	file { "/etc/nagios3/nagios.cfg":
		ensure => present,
		source_permissions => 'ignore',
		source => 'puppet:///modules/nagios/nagios.cfg',
		mode => '0444',
		owner => 'root',
		group => 'root',
		require => Class["nagios::install"],
		notify => Class["nagios::service"] 
	}

	file { "/etc/nagios3/htpasswd.users":
		ensure => present,
		source_permissions => 'ignore',
		source => 'puppet:///modules/nagios/htpasswd.users',
		mode => '0444',
		owner => 'root',
		group => 'root',
		require => Class["nagios::install"],
		notify => Class["nagios::service"] 
	}

	file { "/etc/nagios3/conf.d":
		ensure => directory,
		mode => '0775',
		owner => 'root',
		group => 'puppet',
		require => Class["nagios::install"],
		notify => Class["nagios::service"] 
	}
	
	file { "/usr/lib/nagios/plugins/nagios.pl":
		ensure => present,
		source_permissions => 'ignore',
		source => 'puppet:///modules/nagios/nagios.pl',
		mode => '0755',
		owner => 'root',
		group => 'root',
		require => Class["nagios::install"],
		notify => Class["nagios::service"] 
	}
	
	file { "/etc/nagios-plugins/config/slack.cfg":
		ensure => present,
		source_permissions => 'ignore',
		source => 'puppet:///modules/nagios/slack.cfg',
		mode => '0644',
		owner => 'root',
		group => 'root',
		require => Class["nagios::install"],
		notify => Class["nagios::service"] 
	}
	
	# Nagios Hosts

	nagios_host { "test-i.foo.org.nz":
		target => "/etc/nagios3/conf.d/ppt_hosts.cfg",
		alias => "db",
		check_period => "24x7",
		max_check_attempts => 3,
		check_command => "check-host-alive",
		check_interval => 1,
		notification_period => "24x7",
		notification_interval => 30,
		notification_options => "d,w,u,r",
		contact_groups => "slackgroup",
		mode => "0444",
	}

	nagios_host { "app-i.foo.org.nz":
		target => "/etc/nagios3/conf.d/ppt_hosts.cfg",
		alias => "app",
		check_period => "24x7",
		max_check_attempts => 3,
		check_command => "check-host-alive",
		notification_period => "24x7",
		notification_interval => 30,
		notification_options => "d,u,r",
		mode => "0444",
	}

	nagios_host { "back-i.foo.org.nz":
		target => "/etc/nagios3/conf.d/ppt_hosts.cfg",
		alias => "back",
		check_period => "24x7",
		max_check_attempts => 3,
		check_command => "check-host-alive",
		notification_period => "24x7",
		notification_interval => 30,
		notification_options => "d,u,r",
		mode => "0444",
	}	
	
	# Nagios Hostgroups

	nagios_hostgroup { "my-ssh-servers":
		target => "/etc/nagios3/conf.d/ppt_hostgroups.cfg",
		mode => "0444",
		alias => "My SSH servers",
		members =>"db-i.foo.org.nz, app-i.foo.org.nz, back-i.foo.org.nz",
	}

	nagios_hostgroup { "my-database-servers":
		target => "/etc/nagios3/conf.d/ppt_hostgroups.cfg",
		mode => "0444",
		alias => "My database servers",
		members =>"db-i.foo.org.nz",
	}	
	
	nagios_hostgroup{ "remote-disks":
		target => "/etc/nagios3/conf.d/ppt_hostgroups.cfg",
		mode => "0444",
		alias => "My Remote Disks",
		members =>"db-i.foo.org.nz, app-i.foo.org.nz, back-i.foo.org.nz",
	}
	
	#Nagios Contacts
	
	nagios_contact { 'slack':
        target => '/etc/nagios3/conf.d/ppt_contacts.cfg',
        alias => 'Slack',
		service_notification_period => '24x7',
        host_notification_period => '24x7',
		service_notification_options => 'w,u,c,r',
        host_notification_options => 'd,r',
		service_notification_commands => 'notify-service-by-slack',
		host_notification_commands => 'notify-host-by-slack',
		email => 'root@localhost',
		mode => '0644',
	}
	
	#Nagios Contact Groups
	
	nagios_contactgroup { 'slackgroup':
	  target => '/etc/nagios3/conf.d/ppt_contactgroups.cfg',
	  alias => 'Slack Channel',
	  members => 'slack', 
	  mode => '0644',
	}
	
	# Nagios Services

	nagios_service { "ssh":
		service_description => "ssh servers",
		hostgroup_name => "my-ssh-servers",
		target => "/etc/nagios3/conf.d/ppt_services.cfg",
		check_command => "check_ssh",
		max_check_attempts => 3,
		retry_check_interval => 1,
		normal_check_interval => 1,
		check_period => "24x7",
		notification_interval => 30,
		notification_period => "24x7",
		notification_options => "w,u,c",
		contact_groups => "admins",
		mode => "0644",
	}

	nagios_service { "mysql":
		service_description => "mysql servers",
		hostgroup_name => "my-database-servers",
		target => "/etc/nagios3/conf.d/ppt_services.cfg",
		check_command => "check_mysql_cmdlinecred!nagios!P@ssw0rd",
		max_check_attempts => 3,
		retry_check_interval => 1,
		normal_check_interval => 1,
		check_period => "24x7",
		notification_interval => 30,
		notification_period => "24x7",
		notification_options => "w,u,c",
		contact_groups => "slackgroup",
		mode => "0644",
	}
	
	nagios_service { "nrpe":
		service_description => "nrpe servers",
		hostgroup_name => "remote-disks",
		target => "/etc/nagios3/conf.d/ppt_services.cfg",
		check_command => "check_nrpe_1arg!check_hd",
		max_check_attempts => 3,
		retry_check_interval => 1,
		normal_check_interval => 1,
		check_period => "24x7",
		notification_interval => 30,
		notification_period => "24x7",
		notification_options => "w,u,c",
		contact_groups => "slackgroup",
		mode => "0644",
	}
}
