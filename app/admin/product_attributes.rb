ActiveAdmin.register ProductAttribute do

	index do 
		column :id
		column :value 
		column :product
		column :product_attribute_type 
		column :created_at 
		column :updated_at

		default_actions
	end

end
