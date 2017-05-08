template '/opt/errbot/config.py' do
  source 'config.py.erb'
  owner 'errbot'
  group 'errbot'
  mode '0644'
  action :create
  notifies :run, 'execute[supervisorctl errbot]', :immediately
end

execute 'supervisorctl errbot' do
  command 'supervisorctl restart errbot'
  action :run
end


