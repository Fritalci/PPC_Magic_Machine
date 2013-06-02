task :my_task, :arg1, :arg2 do |t, args|
  puts "Args were: #{args}"
  puts args[:arg1]
  puts args[:arg2]
  puts t
end

task :build_campaign_spreadsheet_by_product_id, :product_id do |t, args|
	puts "Args are: #{args}"
end
