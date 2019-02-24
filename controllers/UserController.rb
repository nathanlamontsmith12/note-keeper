class UserController < ApplicationController 


	get "/" do 

		erb :register

	end


	post "/" do 

		user = User.new 

		user.username = params[:username]

		user.save 

		redirect "/"

	end

end