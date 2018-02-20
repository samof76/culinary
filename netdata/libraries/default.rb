def get_layers()
  layers = Array.new()
  layer_ids = search("aws_opsworks_instance", "self:true").first['layer_ids']
  layer_ids.each do |layer_id|
    layers << search("aws_opsworks_layer", "layer_id:#{layer_id}").first['shortname']
  end
  layers
end
