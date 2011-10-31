class ruby {
  # Install ruby
  exec { "curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer -o rvm-installer; chmod u+x rvm-installer; ./rvm-installer":
    alias   => "install_rvm",
    creates => "/home/${::username}/.rvm",
    cwd     => "/home/${::username}",
    user    => $::username,
  }
}
