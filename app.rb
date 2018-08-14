require 'sinatra'
require_relative 'isbn.rb'
enable :sessions

get '/' do
	nums = []
	final_arr = final_arr
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

	str = ''
	final_arr.each do |n|
		str += '<br>'
	end

	p " |||| #{final_arr}"


	p " |||| #{nums}"
	erb :dashboard, locals:{final_arr: final_arr, nums: nums}
end