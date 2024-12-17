################################################################################
# Class: wget
#
# This class will install wget - a tool used to download content from the web.
#
################################################################################
#
# @param version
#
# @param manage_package
#
class wget (
  String $version         = present,
  Boolean $manage_package = true,
  Hash $config = {},
) {
  if $manage_package {
    if $facts['kernel'] == 'Linux' {
      if ! defined(Package['wget']) {
        package { 'wget': ensure => $version }
      }
    }

    if $facts['kernel'] == 'FreeBSD' {
      if ! defined(Package['ftp/wget']) {
        package { 'ftp/wget': ensure => $version }
      }
    }
  }

  class { "wget::config":
      * => $config,
  }
}
