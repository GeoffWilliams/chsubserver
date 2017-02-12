chsubserver { "rusersd":
    proto  => "udp",
    ensure => "disabled",
}

chsubserver { "ftp":
    proto  => "udp",
    ensure => "enabled",
    params => "ftpd -l -u077",
}
