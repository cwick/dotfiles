$username = 'cwick'

Exec { path => '/usr/bin:/bin:/usr/sbin:/sbin' }

node basenode {
  user { $username:
    managehome => true
  }

  include dotfiles
  include packages
  include sudo
  include ruby
  include gnome-config
}

# Desktop machine
node 'fezmonkey' inherits basenode {}
# Laptop
node 'monkeyballs' inherits basenode {}
