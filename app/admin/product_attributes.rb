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

  form do |f|
    f.inputs "Product Attributes" do
    	f.input :product
    	f.input :product_attribute_type
    	f.input :product_attribute_type_variation
    	f.input :value
    end
    f.buttons                         
  end



end
