class gnome-terminal {
  define config_file($source) {
    file { "/home/${::username}/.gconf/apps/gnome-terminal/${name}/%gconf.xml":
      source => "puppet:///modules/gnome-terminal/${source}",
      mode   => 600,
      owner  => $::username,
      group  => $::username,
    }
  }

  config_file { "profiles/Default":
    source => "default-profile.xml"
  }
  config_file { "keybindings":
    source => "keybindings.xml",
  }
}
