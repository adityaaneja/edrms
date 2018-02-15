name 'edrms'
maintainer 'Aditya Aneja'
maintainer_email 'aneja@ualberta.ca'
license 'All Rights Reserved'
description 'Installs/Configures edrms'
long_description 'Installs/Configures edrms'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/edrms/issues'

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/edrms'

depends 'apache2'
depends 'openssl', '>= 8.1.0'
depends 'alfresco-appserver'
depends 'alfresco-db'
