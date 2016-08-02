# apt.pp
class ubnt::apt(
  $release  = 'unifi5',
  ) {
  apt::source { 'ubnt-unifi':
    location => 'http://www.ubnt.com/downloads/unifi/debian',
    release  => $release,
    repos    => 'ubiquiti',
    key      => {
      id     =>'4A228B2D358A5094178285BE06E85760C0A52C50',
      server => 'keyserver.ubuntu.com',
    }
  }

  $key = 'C0A52C50'
  exec { 'apt-key-unifi-stable' :
    path    => '/bin:/usr/bin',
    unless  => "apt-key list | grep '${key}' | grep -v expired",
    command => "apt-key adv --keyserver keyserver.ubuntu.com \
      --recv-keys ${key}",
  }
}
