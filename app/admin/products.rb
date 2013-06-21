ActiveAdmin.register Product do

  index do                            
    column :title
    column :url 
    column :isbn 
    column 'Create Adwords Spreadsheet' do |product|
    	link_to('Create Spreadsheet',product_path(id: product.id, format:'xls'))
    end
		column :created_at
		column :updated_at
    default_actions
  end                                 

  
end
