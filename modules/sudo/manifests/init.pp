class sudo {
  file { "/etc/sudoers":
    source => "puppet:///modules/sudo/sudoers",
    mode   => 440,
    owner  => root,
    group  => root,
  }
}
