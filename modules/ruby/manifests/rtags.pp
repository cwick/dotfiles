class ruby::rtags {
  $srcdir = "/usr/local/src/rtags"
  
  exec { "git clone https://github.com/gaizka/rtags.git /usr/local/src/rtags":
    creates  => $srcdir,
    require  => Package[git],
    alias    => "rtags-clone",
    user     => root
  }

  exec { "/usr/local/src/rtags/install.sh":
    creates => "/usr/local/bin/rtags",
    require => Exec["rtags-clone"],
    user    => root,
    cwd     => $srcdir,
  }
}
