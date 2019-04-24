# MDS Package

This repository demonstrates a packaging pattern for wrapping software
delivered in an arbitrary fashion. The pattern establishes a command-line user
interface for calling install, uninstall, and verify actions.

In Linux implementation, software-specific scripts are written that support
install, uninstall, and verify actions, and then those scripts are packaged as
RPMs with metadata indicating that they are MDS installer packages. This allows
the RPM database to remain an accurate record of software installed on a
system.

RPM installer packages for MDS-packaged software will only contain the MDS
installer script for that software. The `mds-package` CLI utility should be
used to fully install or uninstall the software.

To list all MDS installed software, the `mds-package` utility will query the
RPM database for packages tagged with the 'MDS Package' vendor.

To install software, the `mds-package` utility will first download and install
the MDS installer RPM, and then it will run the installer.

To uninstall software, the `mds-package` utility will first perform the MDS
installer's uninstall action, and then it will remove the MDS installer RPM.

To verify the health of installed software, the `mds-package` utility will
invoke RPM's verify action for the package. This will in turn invoke the MDS
installer's verify action.

The `mds-package` utility wrapper is required, instead of using RPM's %post and
%preun script actions, because some vendor installers may make use of the RPM
system too. RPM %post and %preun actions hold the RPM transaction lock, which
would prevent some vendor installers from completing during those actions.
