class ProductAttributeType < ActiveRecord::Base
  attr_accessible :name, :type_id

  has_many :product_attributes, :dependent => :nullify
  has_many :product_attribute_type_variations, :dependent => :nullify

end
