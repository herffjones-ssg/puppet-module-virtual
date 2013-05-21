puppet-module-virtual
=====================

Meant to be applied to *ALL* virtual nodes from ghoneycutt/common

# Compatibility #
Meta module that is safe to be applied to all virtualized nodes (where `$::is_virtual == true`).

# Supported Virtualization Platforms #
  * VMWare

# Parameters #

enable_vmware
-------------
Boolean to include ghoneycutt/vmware

- *Default*: false
