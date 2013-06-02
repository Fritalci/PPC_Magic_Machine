class Product < ActiveRecord::Base
  attr_accessible :company_id, :title, :subject, :author, :url, :isbn

  belongs_to :company

  def to_csv(options = {})
  	CSV.generate(options) do |csv|
			csv << self.class.column_names
		end
  end
end
