ActiveAdmin.register ProductAttributeType do

  form do |f|
    f.inputs "Product Attribute Types" do
      f.input :name
      f.input :type_id
    end
    f.buttons
  end                                 


end
