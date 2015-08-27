# Optional parameters in setting up nux
class nux::params {

  $os_maj_release = $::os_maj_version
  $os_basearch    = $::architecture

  $nux_desktop         = {
    'enabled'    => '1',
    'gpgcheck'   => '1',
    'baseurl'    => "http://li.nux.ro/download/nux/dextop/el${os_maj_release}/${os_basearch}/ http://mirror.li.nux.ro/li.nux.ro/nux/dextop/el${os_maj_release}/${os_basearch}/",
    'include'    => undef,
    'exclude'    => undef
  }
  $nux_desktop_testing  = {
    'enabled'    => '0',
    'gpgcheck'   => '1',
    'baseurl'    => "http://li.nux.ro/download/nux/dextop-testing/el${os_maj_release}/${os_basearch}/",
    'include'    => undef,
    'exclude'    => undef
  }
  $nux_misc = {
    'enabled'    => '0',
    'gpgcheck'   => '1',
    'baseurl'    => "http://li.nux.ro/download/nux/misc/el${os_maj_release}/${os_basearch}/  http://mirror.li.nux.ro/li.nux.ro/nux/misc/el${os_maj_release}/${os_basearch}/",
    'include'    => undef,
    'exclude'    => undef
  }
  $nux_misc_testing = {
    'enabled'    => '0',
    'gpgcheck'   => '1',
    'baseurl'    => "http://li.nux.ro/download/nux/misc-testing/el${os_maj_release}/${os_basearch}/",
    'include'    => undef,
    'exclude'    => undef
  }

}