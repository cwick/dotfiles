class packages {
  # Editors
  package { [vim, emacs, emacs-goodies-el, emacs23-el]: }

  # Web
  package { [firefox, chromium-browser]: }

  # System
  package { [aptitude, htop, gparted, compizconfig-settings-manager,
             rpm, smbfs]: }

  # Databases
  package { [sqlite3, postgresql, "postgresql-server-dev-9.1",
             mysql-server, mysql-client, libmysqlclient-dev,
             redis-server, memcached]: }

  # Version control
  package { [git, mercurial]: }

  # Languages
  package { [openjdk-6-jre, openjdk-6-jdk, icedtea6-plugin,
             python,
             ruby,
             ruby-dev,
             gcc]: }

  # Javascript
  package { [nodejs]: }


  # Utilities
  package { [tree, meld, libnss3-tools]: }

  # SDL
  package { ["libsdl-image1.2", "libsdl1.2debian-all", "libsdl-ttf2.0-0", "libsdl-ttf2.0-dev"]: }

  # Misc
  package { [gtk2-engines-pixbuf]: }
}
