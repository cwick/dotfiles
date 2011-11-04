class ruby {
    $rvmdir = "/home/${::username}/.rvm"
    $rvm = ". ${rvmdir}/scripts/rvm; rvm"
    $version = "1.9.2-p290"

    Exec { user => $::username }

    exec { "bash -c \"${rvm} pkg install openssl\"":
      alias   => "rvm-openssl",
      creates => "${rvmdir}/usr/lib/libssl.so",
    }

    exec { "bash -c \"${rvm} install ${version} --with-openssl-dir=${rvmdir}/usr\"":
      creates => "${rvmdir}/rubies/ruby-${version}/",
      require => Exec["rvm-openssl"],
    }
}
