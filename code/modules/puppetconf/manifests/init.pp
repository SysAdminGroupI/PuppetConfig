class puppetconf {
 file { '/etc/puppet/puppet.conf':
  owner => 'root',
  group => 'root',
  mode => '0644',
  source => 'puppet:///modules/puppetconf/puppet.conf'
 }

 service { 'puppet':
  ensure => 'running',
  enable => 'true'
 }
}
