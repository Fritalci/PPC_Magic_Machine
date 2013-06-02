class ProductAttributeType < ActiveRecord::Base
  attr_accessible :name

  has_many :product_attributes, :dependent => :nullify
  belongs_to :product_attribute_type_variation

end
