class dotfiles {
  define dotfile {
    file { "/home/${::username}/.${name}":
      owner    => $::username,
      group    => $::username,
      mode     => 644,
      source   => "puppet:///modules/dotfiles/$name",
    }
  }

  dotfile { [bash_aliases, bashrc, bash_profile, 
             gitconfig, gitignore, hgrc, irbrc,
             sqliterc, inputrc]: }
}
