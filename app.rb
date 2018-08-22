require 'sinatra'
require_relative 'isbn.rb'
require 'csv'
require 'aws-sdk-s3'

load 'local_ENV.rb' if File.exist?('local_ENV.rb')

enable :sessions

s3 = Aws::S3::Client.new(profile: 'Jbrow95', region: 'us-east-1')

get '/' do
	nums = []
	final_arr = []
	erb :dashboard, locals:{final_arr: final_arr, nums: nums}
end

post '/validate' do
	nums = params[:isbn_nums].split("\r\n") 
	final_arr = []

	nums.each do |i|
		if i != ""
			final_arr << isbn_check(i)
		end
	end 
	final_arr

	numbers_arr = []
	CSV.foreach("csv/input.csv", ) do |row|
		numbers_arr << row[1]
	end



	temp = CSV.generate("output_isbn_file.csv") do |csv|
		csv << ["ISBN", "CHECK"]
		numbers_arr.shift
			numbers_arr.each do |num|
			csv << [num, isbn_check(num)]
		end
	end

	s3.put_object(bucket: 'isbn-mm', body: temp, key: 'output_isbn_file.csv')
	
	erb :dashboard, locals:{final_arr: final_arr, nums: nums}
end
