class Theme < ActiveRecord::Base
  attr_accessible :name, :share_count, :tags, :css_url

  has_many :sites
end
