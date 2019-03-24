class example( $version = "1.0.0" ) {

include example::install

class{"example::configure":}

$port = "9099"
$osfamily = "Redhat" 
$pkgname = hiera("packagename")
$pkg_list = hiera_array("packagename")
notify {"   local variable :::  $port   $osfamily":}

notify {"   global variable :::  $::osfamily ":}
notify {"   class variable :::  $version ":}
notify {"   hiera variable :::  $pkgname $pkg_list":}

package { $pkgname:
    ensure => 'installed',
  }
package { 'tree':
    ensure => 'installed',
  }

file { '/tmp/site-conf':
    ensure => 'directory',
  }
file {'/tmp/a.txt':
    ensure => file,
    content => "vbxjvbjkdxbvjhdbjhvbdxb"
}
file {'/tmp/server.xml':
    ensure => file,
    source =>'puppet:///modules/example/server.xml'
}
file {'/tmp/server-temp.xml':
    ensure => file,
    content => template('example/server.xml.erb')
}
}
