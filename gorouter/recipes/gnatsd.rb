package 'tmux' do
  action :install
end

cookbook_file '/usr/bin/gnatsd' do
  source 'gnatsd'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/var/log/gnatsd' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
