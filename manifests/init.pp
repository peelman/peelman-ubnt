# modules/ubnt/manifests/init.pp

class ubnt {
  include ubnt::apt
  include ubnt::unifi
}
