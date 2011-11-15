class packages {
  # Editors
  package { [vim, emacs, emacs-goodies-el, emacs23-el]: }

  # Web
  package { [firefox, chromium-browser]: }

  # System
  package { [aptitude, htop, gparted, compizconfig-settings-manager]: }

  # Databases
  package { [sqlite3, postgresql, mysql-server, mysql-client]: }
  
  # Version control
  package { [git, mercurial, meld]: }

  # Languages
  package { [openjdk-6-jre, openjdk-6-jdk, icedtea6-plugin,
             python,
             ruby,
             gcc]: }

  # Misc
  package { [gtk2-engines-pixbuf]: }
}
