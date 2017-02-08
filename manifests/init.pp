# Chrctcp
#
# Manage services in /etc/inetd with chsubserver
#
# @param proto Protcol to manage - Normally 'tcp' or 'udp'
# @param service Name of service to manage, defaults to $title
# @param ensure 'disabled' to disable a service or 'enabled' to enable it
define chsubserver(
    String $proto,
    String $service = $title,
    Enum['disabled', 'enabled'] $ensure = 'disabled',
) {
  $file = "/etc/inetd.conf"

  if $ensure == "disabled" {
    $_ensure  = "-d"
    $op_match = ""
  } else {
    $_ensure  = "-a"
    $op_match = "#"
  }

  exec { "chrctcp ${service}":
    command => "chsubserver -r inetd -C ${file} ${_ensure} -v ${service} -p ${proto}",
    onlyif  => "grep '^${op_match}.*${service}' < ${file}",
    path    => ["/usr/bin", "/usr/sbin"]
  }
}
