cookbook_file '/srv/gorouter/bin/gorouter' do
  source 'gorouter'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template '/srv/gorouter/etc/gorouter.yml' do
  source 'gorouter.yml.erb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

template '/etc/supervisord.conf' do
  source 'supervisord.conf.erb'
  owner 'root'
  group 'root'
  mode 00744
  notifies :run, 'execute[run supervisord]', :immediately
end

execute 'run supervisord' do
  not_if 'pgrep supervisord'
  command 'supervisord -c /etc/supervisord.conf'
  action :run
end
