class ruby {
    $rvmdir = "/home/${::username}/.rvm"
    $rvm = ". ${rvmdir}/scripts/rvm; rvm"
    $version = "1.9.2-p290"

    Exec {
      user    => $::username,
      timeout => 0, # Installing Ruby can take a while, so disable timeout
    }

    exec { "curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer -o rvm-install; chmod +x rvm-install; ./rvm-install":
      alias   => "rvm-install",
      require => Package["curl"],
    }
    
    exec { "bash -c \"${rvm} pkg install openssl\"":
      alias   => "rvm-openssl",
      creates => "${rvmdir}/usr/lib/libssl.so",
      require => Exec["rvm-install"],
    }

    exec { "bash -c \"${rvm} install ${version} --with-openssl-dir=${rvmdir}/usr\"":
      creates => "${rvmdir}/rubies/ruby-${version}/",
      require => Exec["rvm-openssl"],
    }
}
