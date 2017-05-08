default['errbot'].tap do |errbot|
  errbot['home']='/opt/errbot'
  errbot['config_file']='config.py'
  errbot['kill_signal']='INT'
  errbot['restart']='always'
  errbot['env']='LC_ALL="en_US.UTF-8"'
end

default['errbot']['supervisord'].tap do |supervisord|
  supervisord['nodaemon']="false"
  supervisord['loglevel']="info"
  supervisord['logfile']="/var/log/supervisord"
  supervisord['logfile_maxbytes']="50MB"
  supervisord['logfile_backups']="10"
  supervisord['pidfile']="/var/run/supervisord.pid"
end

default['errbot']['config'].tap do |errconfig|
  errconfig['backend']='Hipchat'
  errconfig['data_dir']='/opt/errbot/data'
  errconfig['extra_plugin_dir']='/opt/errbot/plugins'
  errconfig['log_file']='None'
  errconfig['log_level']='logging.DEBUG'
  errconfig['identity']['username']='XXXXXX_XXXXXXX@chat.hipchat.com'
  errconfig['identity']['password']='changeme'
  errconfig['identity']['token']='0bh4LzV2E0U94hodZr9qzshNlxxxxxxxxxxxxxxx'
  errconfig['chatroom_presence']="'Rooms Comma Seperated',"
  errconfig['chatroom_fn']='bot full name'
  errconfig['admins']="'YYYYYY_XXXXXXX@chat.hipchat.com',"
  errconfig['alt_prefixes']="'@mentions',"
  errconfig['xmpp_keepalive_interval']=60
end

