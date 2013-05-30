class Product < ActiveRecord::Base
  attr_accessible :company_id, :title, :subject, :author, :url, :isbn

  belongs_to :company
end
