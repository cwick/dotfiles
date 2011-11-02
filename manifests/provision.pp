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

node 'fezmonkey' inherits basenode {}
