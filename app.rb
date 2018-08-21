require 'sinatra'
require_relative 'isbn.rb'
require 'csv'
# require 'aws-sdk'

enable :sessions

get '/' do
	# arr_isbn = ""
	nums = []
	final_arr = []
	erb :dashboard, locals:{final_arr: final_arr, nums: nums}
end

post '/validate' do
	nums = params[:isbn_nums].split("\r\n") 
	final_arr = []

	# nums.each do |i|
	# 	if i != ""
	# 		final_arr << isbn_check(i)
	# 	end
	# end 
	# final_arr

	numbers_arr = []
	CSV.foreach("csv/output1.csv", ) do |row|
		numbers_arr << row[1]
	end



	CSV.open("csv/input_isbn_file.csv", "wb") do |csv|
		csv << ["ISBN", "CHECK"]
		numbers_arr.shift
			numbers_arr.each do |num|
			csv << [num, isbn_check(num)]
		end
	end
	
	erb :dashboard, locals:{final_arr: final_arr, nums: nums}
end
