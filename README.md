[![Build Status](https://travis-ci.org/GeoffWilliams/chsubserver.svg?branch=master)](https://travis-ci.org/GeoffWilliams/chsubserver)
# chsubserver

#### Table of Contents

1. [Description](#description)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Manage services in `/etc/inetd.conf` with `chsubserver` on AIX, protect `chsubserver` from running unnecessarily by protecting with `grep`

## Usage

# Disabling inetd services

```puppet
chsubserver { "rusersd":
  proto  => "udp",
  ensure => "disabled",
}
```
Disable the `rusersd` inetd subsystem.

# Enabling inetd services

```puppet
chsubserver { "rusersd":
  proto  => "udp",
  ensure => "enabled",
}
```
Disable the `rusersd` inetd subsystem.


## Reference

### Defined types
* `chsubserver` - manage `inetd` services using chsubserver

## Limitations

* AIX only
* Not supported by Puppet, inc.

## Development

PRs accepted :)

## Testing
This module supports testing using [PDQTest](https://github.com/GeoffWilliams/pdqtest).


Test can be executed with:

```
bundle install
bundle exec pdqtest all
```


See `.travis.yml` for a working CI example
