class nginx {
    Exec { path => "/usr/local/bin:/usr/bin:/bin" }

    file { "/etc/apt/sources.list.d/nginx.list":
        ensure => "present",
        source => "puppet:///modules/nginx/sources.list",
    }

    exec { "sudo apt-get update":
        require => File["/etc/apt/sources.list.d/nginx.list"],
    }
        
    exec { "sudo apt-get install -y --allow-unauthenticated nginx":
        require => Exec["sudo apt-get update"],
    }
}
