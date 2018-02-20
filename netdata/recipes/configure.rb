instance = search("aws_opsworks_instance", "self:true").first
stack = search("aws_opsworks_stack").first

hostname = instance['hostname']
stack_name = stack['name']

template '/etc/netdata/netdata.conf' do
  source 'netdata.conf.erb'
  owner 'netdata'
  group 'netdata'
  variables ({
    :hostname => hostname,
    :stack_name => stack_name
  })
  mode 00660
  notifies :restart, 'service[netdata]', :immediately
end

service 'netdata' do
  supports :status => :true, :restart => :true, :reload => :true
  action [:enable, :start]
end
