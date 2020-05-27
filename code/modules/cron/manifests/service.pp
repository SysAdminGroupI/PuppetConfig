# Class: cron::service
#
# This class managed the cron service
#
# This class should not be used directly under normal circumstances
# Instead, use the *cron* class.
#
class cron::service {
  service {"cron":
	ensure => running,
	enable => true,
  }
}
