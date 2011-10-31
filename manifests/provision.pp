node basenode {
  $username = 'cwick'

  user { $username:
    managehome => true
  }

  class {'dotfiles':
    user => $username
  }
  
  include packages
  include sudo
}


node 'fezmonkey' inherits basenode {}
