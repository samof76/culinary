default['metrichill']['gorouter'].tap do |gorouter|
    gorouter['status']['host'] = 'localhost'
    gorouter['status']['port'] = 8082
    gorouter['status']['user'] = 'admin'
    gorouter['status']['pass'] = 'admin'

    gorouter['nats']['host'] = 'localhost'
    gorouter['nats']['port'] = 4222
    gorouter['nats']['user'] = ''
    gorouter['nats']['pass'] = ''

    gorouter['logging']['syslog'] = 'metrichill.user'
    gorouter['logging']['level'] = 'debug'
    gorouter['logging']['file'] = '/var/log/gorouter.log'

    gorouter['port'] = 8081
    gorouter['index'] = 0
    gorouter['go_max_procs'] = 5
end

default['metrichill']['gorouter']['supervisord'].tap do |supervisord|
  supervisord['nodaemon']="false"
  supervisord['loglevel']="debug"
  supervisord['logfile']="/var/log/supervisord"
  supervisord['logfile_maxbytes']="50MB"
  supervisord['logfile_backups']="10"
  supervisord['pidfile']="/var/run/supervisord.pid"
  supervisord['gorouter']['priority']=500
  supervisord['gorouter']['access_log']="/var/log/gorouter/access.log"
  supervisord['gorouter']['access_log_size']="10MB"
  supervisord['gorouter']['access_log_backups']=10
  supervisord['gorouter']['error_log']="/var/log/gorouter/error.log"
  supervisord['gorouter']['error_log_size']="10MB"
  supervisord['gorouter']['error_log_backups']=10
  supervisord['gnatsd']['priority']=400
  supervisord['gnatsd']['access_log']="/var/log/gnatsd/access.log"
  supervisord['gnatsd']['access_log_size']="10MB"
  supervisord['gnatsd']['access_log_backups']=10
  supervisord['gnatsd']['error_log']="/var/log/gnatsd/error.log"
  supervisord['gnatsd']['error_log_size']="10MB"
  supervisord['gnatsd']['error_log_backups']=10

end
