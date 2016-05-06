# = Class: flapjack::service
#
# Manages the FlapJack services
#
class flapjack::service(
  $service_enabled = true,
  $flapper_enabled = false,
  $nagios_receiver = false,
  $redis_omnibus   = true,
  $version         = "v1"
){
  validate_bool(
    $flapper_enabled,
    $nagios_receiver,
    $redis_omnibus,
    $service_enabled,
  )

  class {'flapjack::service::flapjack':
    service_enabled => $service_enabled
  }

  class {'flapjack::service::flapper':
    flapper_enabled => $flapper_enabled
  }
  
  if $version == "v1" {
  class {'flapjack::service::nagios_receiver':
    nagios_receiver => $nagios_receiver
  }
  }
  class {'flapjack::service::redis':
    redis_omnibus => $redis_omnibus
  }
}
