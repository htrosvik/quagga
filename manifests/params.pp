# 
# For now all configurable variables go here,
# might later move to hiera optionally
#
class quagga::params {

  #$hostname = 'hege-router'
  $password = 'sky'
  $enable = 'enasky'
  $router_id = $::network_lo

  # For future use with hiera
  #$password = hiera("password")
  #$enable = hiera("enable")

  #Zebra variables
  $zebra_logfile = '/var/log/quagga/zebra.log'
  
  #BGP variables
  $AS = ''
  $bgp_alwayscomparemed = false
  $bgp_logfile = '/var/log/quagga/bgpd.log'
  #$bgp_neighbors is an array in the format 
  # ISP1 => { 'neighbor_ip' => '192.0.2.1', 'neighbor_as' => '65001' }
  $bgp_neighbors = {
    neighbor1 => { 'neighbor_ip' => '', 'neighbor_as' => '' },
  }

  #OSPF variables
  $ospf_logfile = '/var/log/quagga/ospfd.log'
  #$ospf_interfaces is an array in the format 
  #$ospf_interfaces = {
  #  interface1 => { 'interface' => 'swp11', 'area' => '0'},
  #}

  #ospf6_interfaces is an array. By default assign it the same values as ospf_interfaces
  $ospf6_interfaces = $ospf_interfaces
}
