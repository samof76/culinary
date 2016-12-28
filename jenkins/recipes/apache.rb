package 'httpd' do
  action :install
end

template '/etc/httpd/conf.d/jenkins.conf' do
  source 'jenkins_apache.conf.erb'
  owner 'root'
  group 'root'
  mode 00744
  notifies :restart, 'service[httpd]', :immediately
end

service 'httpd' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end
