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

  # Install git-meld plugin
  exec { "wget https://raw.github.com/wmanley/git-meld/master/git-meld.pl -O /usr/local/bin/git-meld.pl":
    creates => "/usr/local/bin/git-meld.pl",
    user    => root,
    alias   => "git-meld-download",
  }

  file { "/usr/local/bin/git-meld.pl":
    mode    => 775,
    require => Exec["git-meld-download"],
  }
}
