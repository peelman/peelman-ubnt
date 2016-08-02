# ubnt

#### Table of Contents


2. [Module Description - What the module does and why it is useful](#module-description)
4. [Usage](#usage)
6. [Reference](#reference)
    * [Classes](#classes)
8. [Development](#development)

## Module Description

The ubnt module lets you use Puppet to manage Ubiquiti Apt sources, keys, and the UniFi Controller package.

It installs a systemd service that works with the init.d script provided by Ubiquiti to provide systemd compatibility.

## Usage

### Install the unifi5 apt repo and the UniFi Controller 5.x

```puppet
include ubnt
```

### Install the unifi4 apt repo and the UniFi Controller 4.x

```puppet
class { 'ubnt::apt' : release => 'unifi4' }
include ubnt::unifi
```

## Reference

### Classes

#### Public Classes

* [`ubnt`](#class-ubnt)
* [`ubnt::apt`](#class-apt)
* [`ubnt::unifi`](#class-unifi)

#### Class: `ubnt`

Main class, includes all other classes.

#### Class: `ubnt::apt`

Manages apt repositories.

##### Parameters

* `release`: Specifies the release repo to use.  usually `unifi4` or `unifi5` (default)

#### Class: `ubnt::unifi`

Installs the unifi controller package & corresponding systemd service.

## Development
Pull requests are very welcome.  Feature requests are less so, but still welcome.
