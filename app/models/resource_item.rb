class ResourceItem < ActiveRecord::Base
  attr_accessible :resource_name, :resource_path, :resource_type
end
