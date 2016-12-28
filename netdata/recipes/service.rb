#
# Cookbook Name:: netdata
# Recipe:: netdata_service
#
# Copyright 2016, Sambox LLP
#
# No rights reserved - Do Redistribute

execute "kill netdata" do
  command 'killall netdata'
  only_if "pgrep netdata"
end

service 'netdata' do
  supports :status => :true, :restart => :true, :reload => :true
  action [:enable, :start]
end
