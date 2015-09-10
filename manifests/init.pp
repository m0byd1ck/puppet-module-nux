# Class nux
#
# Actions:
#   Configure the proper repositories and import GPG keys
#
# Requires:
#   You should probably be on an Enterprise Linux variant. (Centos, RHEL, et al)
#
# Sample Usage:
#   include nux
#

class nux (
    $nux_desktop          = $nux::params::nux_desktop,
    $nux_desktop_testing  = $nux::params::nux_desktop_testing,
    $nux_misc             = $nux::params::nux_misc,
    $nux_misc_testing     = $nux::params::nux_misc_testing,
    $os_maj_release       = $nux::params::os_maj_release,
    $os_basearch          = $nux::params::os_basearch,
  ) inherits nux::params {

  if $::osfamily == 'RedHat' and $::operatingsystem !~ /Fedora|Amazon/ {

    yumrepo { 'nux-dextop':
      descr       => 'Nux.Ro RPMs for general desktop use',
      baseurl     => $nux_desktop['baseurl'],
      enabled     => $nux_desktop['enabled'],
      gpgcheck    => $nux_desktop['gpgcheck'],
      gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-nux.ro',
      includepkgs => $nux_desktop['include'],
      exclude     => $nux_desktop['exclude'],
    }

    yumrepo { 'nux-dextop-testing':
      descr       => 'Nux.Ro RPMs for general desktop use - testing',
      baseurl     => $nux_desktop_testing['baseurl'],
      enabled     => $nux_desktop_testing['enabled'],
      gpgcheck    => $nux_desktop_testing['gpgcheck'],
      gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-nux.ro',
      includepkgs => $nux_desktop_testing['include'],
      exclude     => $nux_desktop_testing['exclude'],
    }

    yumrepo { 'nux-misc':
      descr       => "Misc Nux.Ro EL${os_maj_release} RPMs",
      baseurl     => $nux_misc['baseurl'],
      enabled     => $nux_misc['enabled'],
      gpgcheck    => $nux_misc['gpgcheck'],
      gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-nux.ro',
      includepkgs => $nux_misc['include'],
      exclude     => $nux_misc['exclude'],
    }

    yumrepo { 'nux-misc-testing':
      descr       => "Misc Nux.Ro EL${os_maj_release} RPMs - testing",
      baseurl     => $nux_misc_testing['baseurl'],
      enabled     => $nux_misc_testing['enabled'],
      gpgcheck    => $nux_misc_testing['gpgcheck'],
      gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-nux.ro',
      includepkgs => $nux_misc_testing['include'],
      exclude     => $nux_misc_testing['exclude'],
    }

    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-nux.ro':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/nux/RPM-GPG-KEY-nux.ro',
    }

    nux::rpm_gpg_key{ 'nux':
      path   => '/etc/pki/rpm-gpg/RPM-GPG-KEY-nux.ro',
      before => Yumrepo['nux-dextop','nux-dextop-testing','nux-misc', 'nux-misc-testing'],
    }
  } else {
      notice ("Your operating system ${::operatingsystem} will not have the Nux repository applied")
  }
}
