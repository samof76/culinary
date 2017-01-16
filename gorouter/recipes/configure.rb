template '/srv/gorouter/etc/gorouter.yml' do
  source 'gorouter.yml.erb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  notifies :run, 'execute[supervisorctl gorouter]', :immediately
end

execute 'supervisorctl gorouter' do
  command 'supervisorctl restart gorouter'
  action :run
end
