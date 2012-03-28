$username = 'cwick'

Exec {
  path => '/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin',
  logoutput => on_failure,
}

node basenode {
  user { $username:
    managehome => true
  }

  # Set hostname
  host { $hostname:
    ip => $ipaddress,
  }

  ############################################################################
  # Configure postgresql
  ############################################################################
  include postgres
  postgres::database { $username:
      ensure  => present,
      require => Package["postgresql"],
  }
  postgres::role { $username:
      ensure    => present,
      superuser => true,
  }
  postgres::role { "root":
      ensure    => present,
      superuser => true,
  }

  include dotfiles
  include packages
  include sudo
  include ruby
  include gnome-config
  include graphite
  include hbase
  include git-flow
}

# Desktop machine
node 'fezmonkey' inherits basenode {
  class {"inigral":
    centurion_ip    => "192.168.1.110",
    puppetmaster_ip => "192.168.1.142"
  }
}

# Laptop
node 'monkeyballs' inherits basenode {
  class {"inigral":
    centurion_ip    => "192.168.1.110",
    puppetmaster_ip => "192.168.1.142"
  }
}

# iMac at work
node 'bananaphone' inherits basenode {
  class {"inigral":
    centurion_ip    => "10.42.0.100",
    puppetmaster_ip => "10.0.1.58"
  }
}

