ActiveAdmin.register Product do

  index do                            
    column :title
    column :url 
    column :isbn 
    column 'Create Adwords CSV' do |product|
    	link_to('Create CSV',download_product_path(id: product.id, format:'csv'))
    end
		column :created_at
		column :updated_at
    default_actions
  end                                 

  
end
