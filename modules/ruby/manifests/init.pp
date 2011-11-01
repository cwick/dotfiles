class ruby {
    exec { "rvm package install openssl":
      alias   => "rvm-openssl",
      creates => "/usr/share/ruby-rvm/usr/lib/libssl.so",
      require => [Package["libssl-dev"], Package["ruby-rvm"]],
    }

    exec { "rvm install 1.9.2-p180 --with-openssl-dir=/usr/share/ruby-rvm/usr":
      creates => "/usr/share/ruby-rvm/rubies/ruby-1.9.2-p180/",
      require => Exec["rvm-openssl"],
    }
}
