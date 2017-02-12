chsubserver { "rusersd->udp":
    ensure => "disabled",
}

chsubserver { "ftp->tcp":
    ensure => "enabled",
    params => "ftpd -l -u077",
}
