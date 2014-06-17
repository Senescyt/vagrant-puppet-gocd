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

  file { "/etc/environment":
    content => inline_template("JAVA_HOME=$/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.55.x86_64/jre")
  }
}
