#=== Class: quagga
# Description TBD
# Parameters - tbd
#
# === Examples
# TBD (see a pattern?)
#
# === Authors
# Leslie Carr <leslie@cumulusnetworks.com>
#
# === License
# Apache v2

class quagga (
  $zebra  = true,
  $bgpd   = false,
  $ospfd  = true,
  $ospf6d = false,
  $ripd   = false,
  $ripngd = false,
  $isisd  = false,
  $babeld = false,
) {

  $hostname = 'leaf3'
  
  include quagga::params
  
  package { 'quagga':
    ensure   => present,
    before   => Service['quagga']
  }

  service { 'quagga':
    ensure      => running,
    hasrestart  => true,
    hasstatus   => false,
    enable      => true,
  }

  file { '/etc/quagga/daemons':
    mode    => '0644',
    owner   => 'quagga',
    group   => 'quagga',
    content => template('quagga/daemons.erb'),
    notify  => Service['quagga'],
  }

  file { '/etc/quagga/vtysh.conf':
    mode    => '0644',
    owner   => 'quagga',
    group   => 'quagga',
    content => template('quagga/vtysh.conf.erb'),
    notify  => Service['quagga'],
  }

  if $zebra == true {
    include quagga::zebra
  }

  if $bgpd == true {
    include quagga::bgpd
  }

  if $ospfd == true {
    include quagga::ospfd
  }

  if $ospf6d == true {
    include quagga::ospf6d
  }

  if $ripd == true {
    include quagga::ripd
  }

  if $ripngd == true {
    include quagga::ripngd
  }

  if $isisd == true {
    include quagga::isisd
  }

  if $babeld == true {
    include quagga::babeld
  }

}
