# == Class: virtual
#
# Applies to any system that is virtualized.
#
# === Copyright
#
# Copyright 2013 GH Solutions, LLC
#
class virtual {

  case $::virtual {
    'hyperv': {
      include hyperv
    }
    #'rhev': {
    #  include rhev
    #}
    default: {
      #fail("Supported virtualization platforms are RHEV and HyperV and this system is ${::virtual}")
      fail("Supported virtualization platform is HyperV and this system is ${::virtual}")
    }
  }
}
