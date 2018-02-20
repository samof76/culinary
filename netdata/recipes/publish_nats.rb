cookbook_file '/usr/local/bin/nats-pub' do
  source 'nats-pub'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

instance = search("aws_opsworks_instance", "self:true").first
stack = search("aws_opsworks_stack").first

hostname = instance['hostname']
instance_ip = instance['private_ip']
stack_name = stack['name']
layers = get_layers()

cron 'publish_to_nats' do
  command "/usr/local/bin/nats-pub -s #{node['metrichill']['nats']} 'router.register' '{\"host\":\"#{instance_ip}\",\"port\":19999,\"uris\":[\"#{hostname}-#{stack_name}.#{node['metrichill']['domain']}\"],\"tags\":{\"name\":\"#{hostname}\",\"stack\":\"#{stack_name}\",\"layers\":\"#{layers.join('::')}\" }}'"
end
