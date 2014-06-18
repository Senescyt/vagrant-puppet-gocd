# Class: goserver
#
#
class goserver {
  require gobase

  package {
    "go-server":
      ensure  => installed,
      require => Yumrepo['ThoughtWorks']
  }

  file{
    '/etc/default/go-server':
      ensure  => present,
      require => Package['go-server'],
      content => template('goserver/go-server.erb')
  }

  service { 'go-server' :
    ensure  => running,
    enable  => true,
    require => File['/etc/default/go-server']
  }  

  firewall { '000 allow 8153 and 8154':
    port   => [8153, 8154],
    proto  => tcp,
    action => accept,
  }
  
}
