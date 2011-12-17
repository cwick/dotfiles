$username = 'cwick'

Exec { path => '/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin' }

node basenode {
  user { $username:
    managehome => true
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
  include inigral
  include graphite
}

# Desktop machine
node 'fezmonkey' inherits basenode {}
# Laptop
node 'monkeyballs' inherits basenode {}
# iMac at work
node 'bananaphone' inherits basenode {}

