class graphite {
  $series = "0.9"
  $version = "0.9.9"
  $download_url = "http://launchpad.net/graphite/${series}/${version}/+download"
  $download_path = "/usr/local/src"
  $components = [whisper, carbon, graphite-web]
  $prefix = "/opt/graphite"

  package {[
    python-django,
    python-django-tagging,
    python-twisted,
    python-cairo,
    python-cairo-dev]:
  }

  define download_source {
    exec { "wget \
            ${graphite::download_url}/${name}-${graphite::version}.tar.gz \
            -P ${graphite::download_path}":
      creates => "${graphite::download_path}/${name}-${graphite::version}.tar.gz",
      alias   => "graphite-download-${name}",
    }
  }
 
  define extract_source {
    exec { "tar xf \
            ${graphite::download_path}/${name}-${graphite::version}.tar.gz \
            -C ${graphite::download_path}":
      require => Exec["graphite-download-${name}"],
      creates => "${graphite::download_path}/${name}-${graphite::version}",
      alias   => "graphite-extract-${name}",
    }
  }  

  define install_component($creates) {
    exec { "graphite-install-${name}":
      command => "python setup.py install --record files.txt",
      cwd     => "${graphite::download_path}/${name}-${graphite::version}",
      require => Exec["graphite-extract-${name}"],
      creates => $creates,
    }
  }


  define config_file {
    file { "${graphite::prefix}/conf/${name}.conf":
      source  => "puppet:///modules/graphite/${name}.conf"
    }
  }

  download_source { $components: }
  extract_source { $components: }

  install_component{ whisper:
    creates => "/usr/local/bin/whisper-info.py"
  }

  install_component{ carbon:
    creates => "/opt/graphite/lib/carbon/"
  }

  install_component{ graphite-web:
    creates => "/opt/graphite/webapp/graphite/"
  }

  config_file { [carbon, storage-schemas]: }

  Install_component<||> -> Config_file<||>  
}
