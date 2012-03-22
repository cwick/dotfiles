class ruby {
    $rvmdir = "/home/${::username}/.rvm"
    $rvm = ". ${rvmdir}/scripts/rvm; rvm"
    $version = "1.9.3-p0"

    include ruby::rtags

    Exec {
      user    => $::username,
      timeout => 0, # Installing Ruby can take a while, so disable timeout
    }

    # Additional Ruby dependencies listed in 'rvm requirements'
    package { [build-essential, openssl, libreadline6, libreadline6-dev, curl, git-core, zlib1g, zlib1g-dev, libssl-dev, libyaml-dev, libsqlite3-0, libsqlite3-dev, libxml2-dev, libxslt1-dev, autoconf, libc6-dev, libncurses5-dev, automake, libtool, bison, subversion]:
    }

    exec { "curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer -o rvm-install; chmod +x rvm-install; ./rvm-install":
      alias   => "rvm-install",
      require => Package["curl"],
      creates => $rvmdir
    }

    # Don't think I need this anymore. Was causing segfaults in the ruby interpreter
    # exec { "bash -c \"${rvm} pkg install openssl\"":
    #   alias   => "rvm-openssl",
    #   creates => "${rvmdir}/usr/lib/libssl.so",
    #   require => Exec["rvm-install"],
    # }

    # This exec rule used to use the option "--with-openssl-dir=${rvmdir}/usr"
    # But this caused a crash in the ruby interpreter when invoking PGconn.connect
    exec { "bash -c \"${rvm} install ${version}\"":
      creates => "${rvmdir}/rubies/ruby-${version}/",
      #      require => Exec["rvm-openssl"],
    }
}
