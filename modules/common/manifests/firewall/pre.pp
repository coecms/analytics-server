## \file    modules/common/manifests/firewall/pre.pp
#  \author  Scott Wales <scott.wales@unimelb.edu.au>
#
#  Copyright 2014 ARC Centre of Excellence for Climate Systems Science
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

class common::firewall::pre {
  Firewall {
    require => undef,
  }

  firewall {'000 ip4 accept icmp':
    proto  => 'icmp',
    action => 'accept',
  }
  firewall {'001 ip4 accept loopback':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }
  firewall {'002 ip4 accept established':
    proto   => 'all',
    ctstate => ['RELATED','ESTABLISHED'],
    action  => 'accept',
  }

  firewall {'000 ip6 accept icmp':
    proto    => 'icmp',
    action   => 'accept',
    provider => 'ip6tables',
  }
  firewall {'001 ip6 accept loopback':
    proto    => 'all',
    iniface  => 'lo',
    action   => 'accept',
    provider => 'ip6tables',
  }
  firewall {'002 ip6 accept established':
    proto    => 'all',
    ctstate  => ['RELATED','ESTABLISHED'],
    action   => 'accept',
    provider => 'ip6tables',
  }
}
