#
# Cookbook Name:: netdata
# Recipe:: netdata
#
# Copyright 2016, Sambox LLP
#
# No rights reserved - Do Redistribute
execute 'install netdata' do
  command 'bash <(curl -Ss https://my-netdata.io/kickstart.sh) all --dont-wait'
  action :run
end
