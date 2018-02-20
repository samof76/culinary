#
# Cookbook Name:: netdata
# Recipe:: netdata
#
# Copyright 2016, Sambox LLP
#
# No rights reserved - Do Redistribute
bash 'install netdata' do
  code <<-EOH
  wget https://my-netdata.io/kickstart.sh
  bash kickstart.sh all --dont-wait
  EOH
  cwd '/tmp'
  action :run
end
