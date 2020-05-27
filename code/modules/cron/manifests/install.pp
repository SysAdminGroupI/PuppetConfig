# == Class: cron::install
#
# This class ensures that the distro-appropriate cron package is installed
#
# This class should not be used directly under normal circumstances
# Instead, use the *cron* class.
#
class cron::install {
  package { "cron":
	ensure => present,
			
}
}
