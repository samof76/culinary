template '/etc/netdata/netdata.conf' do
  source 'netdata.conf.erb'
  backup true
  owner 'netdata'
  group 'netdata'
  mode 00660
  notifies :restart, 'service[netdata]', :immediately
end

service 'netdata' do
  supports :status => :true, :restart => :true, :reload => :true
  action [:enable, :start]
end
