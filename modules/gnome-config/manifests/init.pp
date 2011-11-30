class gnome-config {
  define app_prerequisites {
    file { "/home/${::username}/.gconf/apps/${name}/":
      ensure => directory,
      owner  => $::username,
      group  => $::username,
    }
  }

  define config_file($source, $app) {
    if !defined(App_Prerequisites[$app]) {
      app_prerequisites { $app: }
    }
    
    file { "/home/${::username}/.gconf/apps/${app}/${name}/":
      ensure => directory,
      owner  => $::username,
      group  => $::username,
    }
    file { "/home/${::username}/.gconf/apps/${app}/${name}/%gconf.xml":
      source => "puppet:///modules/gnome-config/${app}/${source}",
      mode   => 664,
      owner  => $::username,
      group  => $::username,
    }
  }

  file { ["/home/${::username}/.gconf/",
          "/home/${::username}/.gconf/apps/"]:
    ensure => directory,
    owner  => $::username,
    group  => $::username,
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
    source => "window_keybindings.xml",
    app    => "metacity",
  }
  config_file { "global_keybindings":
    source => "global_keybindings.xml",
    app    => "metacity",
  }
}
