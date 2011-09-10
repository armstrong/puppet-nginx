class nginx {
    Exec { path => "/usr/local/bin:/usr/bin:/bin" }

    file { "/tmp/nginx-install/":
        ensure => "directory",
        source => "puppet:///modules/nginx/install/",
        recurse => true,
    }

    file { "/tmp/nginx-install/install.sh":
        ensure => "file",
        mode => "700",
        source => "puppet:///modules/nginx/install/install.sh",
    }
        
    exec { "nginx dependencies":
        command => "sudo apt-get build-dep -y nginx",
    }

    exec { "sudo sh -c 'cd /tmp/nginx-install/ && ./install.sh'":
        require => [
            File["/tmp/nginx-install/install.sh"],
            Exec["nginx dependencies"],
        ],
    }
}
