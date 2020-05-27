# Class: cron
#
# This class wraps *cron::install* for ease of use
#
# Parameters:
#   manage_package - Can be set to disable package installation.
#     Set to true to manage it, false to not manage it.
#     Default: true
#
#   package_ensure - Can be set to a package version, 'latest', 'installed' or
#     'present'.
#     Default: installed
#
#   package_name - Can be set to install a different cron package.
#     Default: see params.pp
#
#   service_name - Can be set to define a different cron service name.
#     Default: see params.pp
#
#   manage_service - Defines if puppet should manage the service.
#     Default: true
#
#   service_enable - Defines if the service should be enabled at boot.
#     Default: true

#   service_ensure - Defines if the service should be running.
#     Default: running
#
# Sample Usage:
#   include 'cron'
# or:
#   class { 'cron':
#     manage_package => false,
#   }
#
class cron {

include cron::install, cron::service, cron::daily

}
