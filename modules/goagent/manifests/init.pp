# Class: goagent
#
#
 class goagent (
  $goserver_ip,
  $goserver_port
) {
  require gobase

  package {
    "go-agent":
      ensure  => installed,
      require => Yumrepo['ThoughtWorks']
  } 

  package { 'java-1.7.0-openjdk.x86_64':
    ensure => installed
  }
  
  service { 'go-agent' :
    ensure  => running,
    enable  => true,
    require => File['/etc/default/go-agent']
  } 
  
  file { '/etc/default/go-agent':
    ensure  => file,
    content => template("goagent/config.erb"),
    require => Package['go-agent'],
    notify  => Service["go-agent"]
  }
}
