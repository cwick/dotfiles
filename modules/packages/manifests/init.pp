class packages {
  # Editors
  package { [vim, emacs]: }

  # Web
  package { [firefox, chromium-browser]: }

  # System
  package { [aptitude, htop]: }

  # Version control
  package { [git, mercurial, meld]: }

  # Languages
  package { [openjdk-6-jre, openjdk-6-jdk, icedtea6-plugin]: }

  # Misc
  package { [gtk2-engines-pixbuf]: }
}
