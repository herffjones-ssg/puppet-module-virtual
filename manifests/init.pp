# == Class: virtual
#
# Meant to be applied to any system that is virtualized.
#
# == Parameters
#
# enable_vmware
# -------------
# Boolean to include ghoneycutt/vmware
#
# - *Default*: false
#
class virtual (
  $enable_vmware = false,
) {

  case $::virtual {
    'vmware': {
      # validate type and convert string to boolean if necessary
      $enable_vmware_type = type($enable_vmware)
      if $enable_vmware_type == 'string' {
        $vmware_enabled = str2bool($enable_vmware)
      } else {
        $vmware_enabled = $enable_vmware
      }
      if $vmware_enabled == true {
        include vmware
      }
    }
    default: {
      fail("Virtualization platform <${::virtual}> is not supported.")
    }
  }
}
