#
# Cookbook Name:: netdata
# Recipe:: netdata_service
#
# Copyright 2016, Sambox LLP
#
# No rights reserved - Do Redistribute

service 'netdata' do
  supports :status => :true, :restart => :true, :reload => :true, :stop => :true
  action [:enable, :start]
end

include_recipe "netdata::publish_nats"