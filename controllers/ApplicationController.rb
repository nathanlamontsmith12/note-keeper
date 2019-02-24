class ApplicationController < Sinatra::Base 

	require 'bundler'
	Bundler.require()

	ActiveRecord::Base.establish_connection(
		:adapter => 'postgresql',
		:database => 'note_keeper'
	)

	use Rack::MethodOverride 
	set :method_override, true

	set :views, File.expand_path("../../views", __FILE__)

	set :public_dir, File.expand_path("../../public", __FILE__)

	get '/' do |variable = nil|
		
		erb :home

	end


	get '/test' do 

		binding.pry 

		redirect "/"

	end

end