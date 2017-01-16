cookbook_file '/usr/local/bin/nats-pub' do
  source 'nats-pub'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cron 'publish to nats' do
  command "/usr/local/bin/nats-pub 
            -s #{node['metrichill']['nats']}
            'router.register' '{\"host\":\"#{node['metrichill']['register_ip']}\",\"port\":19999,\"uris\":[\"#{node['netdata']['backend']['hostname']}.#{node['metrichill']['domain']}\"],\"tags\":{\"name\":\"local\",\"type\":\"perf\"}}'"
end
