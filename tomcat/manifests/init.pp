class tomcat{

package{"tomcat7":
  ensure => latest,
  before => File["/tmp/server.xml"]
}

file {"/tmp/server.xml":
  ensure => file,
  content => template('tomcat/server.xml.erb'),
  require => Package["tomcat7"],
  notify => Service["tomcat7"]
}
service{"tomcat7":
 ensure => running,
 subscribe => File["/tmp/server.xml"]
}

}
