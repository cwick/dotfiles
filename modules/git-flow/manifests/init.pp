class git-flow {
  exec { "wget --no-check-certificate -q -O /usr/local/src/gitflow-installer.sh https://github.com/nvie/gitflow/raw/develop/contrib/gitflow-installer.sh":
    alias   => "git-flow-download",
    user    => root,
    creates => "/usr/local/src/gitflow-installer.sh",
  }

  exec { "bash /usr/local/src/gitflow-installer.sh":
    user    => root,
    require => Exec['git-flow-download'],
    creates => '/usr/local/bin/git-flow-init',
    cwd     => '/tmp',
  }

  # Bash completion script
  exec { "wget -q -O /etc/bash_completion.d/git-flow-completion https://raw.github.com/bobthecow/git-flow-completion/master/git-flow-completion.bash":
    creates => '/etc/bash_completion.d/git-flow-completion'
  }
}
