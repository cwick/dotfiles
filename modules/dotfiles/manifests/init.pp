class dotfiles {
  define dotfile {

    file { "/home/${::username}/.${name}":
      owner    => $::username,
      group    => $::username,
      mode     => 644,
      source   => "puppet:///modules/dotfiles/$name",
    }
  }


  define bash_alias($source) {
    file { "/home/${::username}/.bash_aliases.d/${name}":
      owner    => $::username,
      group    => $::username,
      source   => $source,
      require  => File["bash-aliases-dir"]
    }
  }

  file { "/home/${::username}/.bash_aliases.d/":
    ensure => directory,
    owner  => $::username,
    group  => $::username,
    alias  => "bash-aliases-dir",
  }


  dotfile { [bashrc, bash_profile, 
             gitconfig, gitignore, hgrc, irbrc,
             sqliterc, inputrc]: }

  bash_alias { "base":
    source => "puppet:///modules/dotfiles/bash_aliases",
  }
}
