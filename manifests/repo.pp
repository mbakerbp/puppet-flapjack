# = Class: flapjack::repo
#
# Installs the FlapJack Repositories
#
class flapjack::repo(
  $enable_repo = false,
  $release = "main",
  $version = "v1"
){
  validate_bool($enable_repo)
  validate_string($release)
  if $enable_repo {
    case $::osfamily {
      'Debian': {
      class {'flapjack::repo::apt':
      release => $release,
      version => $version
      }
      }
      'RedHat': {
      class {'flapjack::repo::yum':
      release => $release
      }
      }
      default: { alert("${::osfamily} not supported yet") }
    }
  }
}
