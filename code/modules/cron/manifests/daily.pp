# Type: cron::daily
#
# This type creates a daily cron job via a file in /etc/cron.d
#
# Parameters:
#   ensure - The state to ensure this resource exists in. Can be absent, present
#     Defaults to 'present'
#   minute - The minute the cron job should fire on. Can be any valid cron
#   minute value.
#     Defaults to '0'.
#   hour - The hour the cron job should fire on. Can be any valid cron hour
#   value.
#     Defaults to '0'.
#   environment - An array of environment variable settings.
#     Defaults to an empty set ([]).
#   user - The user the cron job should be executed as.
#     Defaults to 'root'.
#   mode - The mode to set on the created job file
#     Defaults to 0600.
#   description - Optional short description, which will be included in the
#   cron job file.
#     Defaults to undef.
#   command - The command to execute.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#   cron::daily { 'mysql_backup':
#     minute      => '1',
#     hour        => '3',
#     environment => [ 'PATH="/usr/sbin:/usr/bin:/sbin:/bin"' ],
#     command     => 'mysqldump -u root my_db >/backups/my_db.sql',
#   }
#
class cron::daily { 
	cron{'backup':
    ensure      => present,
    minute      => '*',
    hour        => [6,12,18,0],
    month       => '*',
    weekday     => '*',
    user        => 'student',
    environment => [],
    command     => 'bash ~/backup.sh',
  }

}

