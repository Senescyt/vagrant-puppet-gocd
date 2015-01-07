# Class:: gobase
#
#
class gobase {
  yumrepo { 'ThoughtWorks':
    descr    => 'ThoughtWorks GO Repo',
    enabled  => 1,
    gpgcheck => 0,
    baseurl  => 'http://download01.thoughtworks.com/go/yum/no-arch',
  }

  package {
    'git':
      ensure => installed
  }

  package { 
    'java-1.7.0-openjdk-devel.x86_64':
      ensure => installed
  }

  file { "/etc/environment":
      content => inline_template("JAVA_HOME=$/usr/lib/jvm/java/jre")
  }
  
} # Class:: gobase
