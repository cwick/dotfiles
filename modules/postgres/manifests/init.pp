class postgres {
  exec { "Set default encoding to UTF-8":
    command => "pg_dropcluster --stop 9.1 main; pg_createcluster --start -e UTF-8 9.1 main",
    unless => "psql -l | egrep 'template1.*\\|.+\\| UTF8'",
    require => [Postgres::Role["root"], Package["postgresql"]],
    alias   => "fix-postgres-encoding"
  }

  file { "/etc/postgresql/9.1/main/pg_hba.conf":
    require => Exec["fix-postgres-encoding"],
    mode    => 640,
    owner   => "postgres",
    group   => "postgres",
    source  => "puppet:///modules/postgres/pg_hba.conf"
  }
}
