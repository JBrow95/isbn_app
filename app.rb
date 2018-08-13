require 'sinatra'
require_relative 'isbn.rb'
enable :sessions

get '/' do
	final = session[:result]
	erb :dashboard, locals:{final: final}
end

post '/validate' do
	nums = params[:isbn]
	session[:result] = isbn_check(nums)
	final = session[:result]
	redirect '/'
end