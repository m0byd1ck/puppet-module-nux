# Puppet Nux Module

#### Table of Contents

1. [Description](#description)
2. [Setup](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with nux module](#beginning-with-nux-module)
3. [Usage](#usage)
4. [Limitations](#limitations)
5. [Development](#development)
6. [Further Information](#further-information)

## Description

The following repo will be setup and enabled by default:

  * nux-desktop

Other repositories that will setup but disabled

  * nux-desktop-testing
  * nux-misc
  * nux-misc-testing
  
## Setup

### Setup Requirements

None


### Beginning with nux module	

    include nux

## Usage
    
    class {'nux':
        nux_desktop           => [
            'enabled'    => '1',
            'gpgcheck'   => '1',
            'baseurl'    => "http://li.nux.ro/download/nux/dextop/el7/x86_64/ http://mirror.li.nux.ro/li.nux.ro/nux/dextop/el7/x86_64/",
            'include'    => ['package1', 'package*', 'package?'],
            'exclude'    => ['package1', 'package*', 'package?']
          ],
          nux_desktop_testing  => [
            'enabled'    => '0',
            'gpgcheck'   => '1',
            'baseurl'    => "http://li.nux.ro/download/nux/dextop-testing/el7/x86_64/",
            'include'    => ['package1', 'package*', 'package?'],
            'exclude'    => ['package1', 'package*', 'package?']
          ],
          nux_misc => [
            'enabled'    => '0',
            'gpgcheck'   => '1',
            'baseurl'    => "http://li.nux.ro/download/nux/misc/el7/x86_64/ http://mirror.li.nux.ro/li.nux.ro/nux/misc/el7/x86_64/",
            'include'    => ['package1', 'package*', 'package?'],
            'exclude'    => ['package1', 'package*', 'package?']
          ],
          nux_misc_testing => [
            'enabled'    => '0',
            'gpgcheck'   => '1',
            'baseurl'    => "http://li.nux.ro/download/nux/misc-testing/el7/x86_64/",
            'include'    => ['package1', 'package*', 'package?'],
            'exclude'    => ['package1', 'package*', 'package?']
          ]
    }
    
## Limitations

* This was tested using Puppet 3.8.2 on CentOS 7
* Use at your own risk, I do not offer any guarantee or warranty

## Development

Please create a pull request via GitHub

## Futher Information

* [nux website](http://li.nux.ro/repos.html)