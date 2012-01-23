class hbase {
  $hbase_version = "0.90.4"
  $hbase_folder = "hbase-${hbase_version}"
  $hbase_tarball = "${hbase_folder}.tar.gz"
  $srcdir        = "/usr/local/src"
  $rootdir       = "/opt/hbase"
  $user          = "root"
  
  exec { "wget http://www.apache.org/dist/hbase/${hbase_folder}/${hbase_tarball} -O ${srcdir}/${hbase_tarball}":
    creates => "${srcdir}/${hbase_tarball}",
    alias   => "hbase-download",
    timeout => 0,
  }
  
  exec { "tar xf ${srcdir}/${hbase_tarball} -C ${srcdir}":
    creates => "${srcdir}/${hbase_folder}",
    alias   => "hbase-extract",
    require => Exec["hbase-download"],
  }

  exec { "cp -R ${srcdir}/${hbase_folder} ${rootdir}":
    creates => $rootdir,
    alias   => "hbase-install",
    require => Exec["hbase-extract"],
  }

  file { "${rootdir}/conf/hbase-site.xml":
    source  => "puppet:///modules/hbase/hbase-site.xml", 
    require => Exec["hbase-install"],
    owner   => $user,
    group   => $user,
    mode    => 644
  }

  file { "${rootdir}/conf/hbase-env.sh":
    source  => "puppet:///modules/hbase/hbase-env.sh", 
    require => Exec["hbase-install"],
    owner   => $user,
    group   => $user,
    mode    => 644
  }
}
