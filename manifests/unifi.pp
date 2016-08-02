# unifi.pp
class ubnt::unifi {

    package { 'unifi' :
      ensure  => latest,
      require => Apt::Source['ubnt-unifi'],
    }

    file { '/usr/lib/unifi/unifi.service' :
      source  =>  'puppet:///modules/ubnt/systemd.unifi.service',
      require => Package['unifi'],
      mode    =>  '0644',
      owner   =>  root,
      group   =>  root,
      notify  =>  [
        Exec['enable-unifi-service'],
      ],
    }

    exec { 'enable-unifi-service' :
      refreshonly => true,
      require     => File['/usr/lib/unifi/unifi.service'],
      command     => '/bin/systemctl -f enable /usr/lib/unifi/unifi.service',
      creates     => [
        '/etc/systemd/system/unifi.service',
        '/etc/systemd/system/multi-user.target.wants/unifi.service',
      ],
      notify      => Service['unifi'],
    }

    service { 'unifi' :
      ensure     => running,
      require    => [
        Package['unifi'],
        File['/usr/lib/unifi/unifi.service'],
      ],
      enable     => true,
      hasrestart => true,
      hasstatus  => true,
    }

}
