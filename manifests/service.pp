# @summary
#   Allows for the Apache service to restart when triggered
class apache::service {
  schedule { 'everyday':
    period => 'daily',
    range  => "1-6",
  }

  service { "${apache::service_name}":
    alias       => 'apache_service',
    ensure      => $apache::service_ensure,
    enable      => $apache::service_enable,
    hasrestart  => true,
#    audit       => ['name', 'ensure', 'hasrestart']
#    before      => File["apache_config"]
    loglevel    => debug,
#   noop        => true,
#    notify      => File["apache_config"]    
#    require     => File["apache_config"]
    schedule    => 'everyday',
#    tag         => ['basemodule', 'web']
  }
}
