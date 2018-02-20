package 'nginx' do
  action :install
end


instance = search("aws_opsworks_instance", "self:true").first
stack = search("aws_opsworks_stack").first

hostname = instance['hostname']
stack_name = stack['name']


template "/etc/nginx/conf.d/vhost_#{node['netdata']['nginx']['vhost']['backend']}.conf" do
  source 'vhost_config.conf.erb'
  owner 'root'
  group 'root'
  mode 00744
  variables ({
    :hostname => hostname,
    :stack_name => stack_name
  })
  notifies :restart, 'service[nginx]', :immediately
end

service 'nginx' do
  supports :status => true, :reload => true, :restart => true
  action [ :enable, :start ]
end
