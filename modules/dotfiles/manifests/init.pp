class dotfiles($user) {
  define dotfile {
    file { "/home/${dotfiles::user}/.${name}":
      owner    => $dotfiles::user,
      group    => $dotfiles::user,
      mode     => 644,
      source   => "puppet:///modules/dotfiles/$name",
      require  => User[$dotfiles::user]
    }
  }

  dotfile { [bash_aliases, bashrc, bash_profile, 
             gitconfig, gitignore, hgrc, irbrc,
             sqliterc, inputrc]: }
}
