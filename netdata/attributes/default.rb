# enabled = no
# data source = average
# type = graphite
# destination = localhost
# prefix = netdata
# hostname = samuel-HP-ProBook-430-G3
# update every = 10
# buffer on failures = 10
# timeout ms = 20000

default['netdata']['backend']['enable'] = 'no'
default['netdata']['backend']['data_source'] = 'average'
default['netdata']['backend']['type'] = 'openstdb'
default['netdata']['backend']['destination'] = 'address to opentsdb host_ip'# node['openstdb']['host_ip']
default['netdata']['backend']['prefix'] = 'netdata'
default['netdata']['backend']['hostname'] = node['opsworks']['instance']['hostname']
default['netdata']['backend']['update_every'] = 10
default['netdata']['backend']['buffer_on_failures'] = 10
default['netdata']['backend']['timeout_ms'] = 20000

default['netdata']['registry']['enabled'] = 'no'
default['netdata']['registry']['registry_to_announce'] = node['opsworks']['instance']['private_dns_name']
default['netdata']['registry']['verify_browser_cookies_support'] = 'yes'

default['netdata']['nginx']['vhost']['server_name'] = 'server_name'
default['netdata']['nginx']['vhost']['backend'] = 'backend'

default['metrichill']['domain'] = 'netdataregistry.freshpo.com'
default['metrichill']['register_ip'] = node['opsworks']['instance']['private_ip']