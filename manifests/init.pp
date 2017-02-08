# Chrctcp
#
# Manage services in /etc/inetd with chsubserver
#
# @param proto key - inetd service to manage in the form service->protocol, eg
#   echo->udp
# @param ensure 'disabled' to disable a service or 'enabled' to enable it
# @param refresh_service True to HUP the service after disabling otherwise false
define chsubserver(
    String $key = $title,
    Enum['disabled', 'enabled'] $ensure = 'disabled',
    Boolean $refresh_service = false
) {
  $file = "/etc/inetd.conf"

  if $key.match(/.+->.+/) {
    $key_split  = split($key, '->')
    $service    = $key_split[0]
    $proto      = $key_split[1]

    if $ensure == "disabled" {
      $_ensure  = "-d"
      $op_match = ""
    } else {
      $_ensure  = "-a"
      $op_match = "#"
    }

    if $refresh_service {
      $_refresh_service = "-r"
    } else {
      $_refresh_service = ""
    }

    exec { "chrctcp ${title}":
      command => "chsubserver ${refresh_service} inetd -C ${file} ${_ensure} -v ${service} -p ${proto}",
      onlyif  => "grep '^${op_match}.*${service}' < ${file}",
      path    => ["/usr/bin", "/usr/sbin"]
    }
  } else {
    fail("Incorrect key format for :'${key}, needs to be service->protcol, eg echo->udp")
  }
}
