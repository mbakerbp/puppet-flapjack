# = Class: flapjack::repo::apt
#
# Installs the Flapjack Debian Repository
#
class flapjack::repo::apt(
    $release = "main",
    $version = "v1"
){

  apt::source { 'flapjack':
    location    => "http://packages.flapjack.io/deb/${version}",
    repos       => $release,
    key         => 'CD2EFD2A',
    include_src => false
  }

}
