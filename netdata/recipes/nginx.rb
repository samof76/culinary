package 'nginx' do
  action :install
end

template '/etc/nginx/conf.d/vhost_#{node["netdata"]["nginx"]["vhost"]["backend"]}.conf' do
  source 'vhost_config.conf.erb'
  owner 'root'
  group 'root'
  mode 00744
  notifies :restart, 'service[nginx]', :immediately
end

service 'nginx' do
  supports :status => true, :reload => true, :restart => true
  action [ :enable, :start ]
end
