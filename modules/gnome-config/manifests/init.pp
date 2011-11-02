class gnome-config {
  define config_file($source, $app) {
    file { "/home/${::username}/.gconf/apps/${app}/${name}/":
      ensure => directory,
    }
    file { "/home/${::username}/.gconf/apps/${app}/${name}/%gconf.xml":
      source => "puppet:///modules/gnome-config/${app}/${source}",
      mode   => 600,
      owner  => $::username,
      group  => $::username,
    }
  }

  config_file { "profiles/Default":
    source => "default-profile.xml",
    app    => "gnome-terminal",
  }
  config_file { "keybindings":
    source => "keybindings.xml",
    app    => "gnome-terminal",
  }
  config_file { "window_keybindings":
    source => "keybindings.xml",
    app    => "metacity",
  }
}
