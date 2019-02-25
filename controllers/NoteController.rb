class NoteController < ApplicationController 

	# landing
	get "/" do 

		@all_users = User.all.sort  

		pp @all_users

		puts "@all_users.length: "
		puts @all_users.length 

		puts @all_users[0].username 


		erb :landing 

	end


	# index 
	get "/:user_id" do 

		@user = User.find params[:user_id]
		@user_notes = []

		user_notes_ids = []

		# get through table data: 
		user_notes_intermediate = UserNotes.all 

		# get all notes_ids for this user, only: 
		user_notes_intermediate.each do |pair| 

			if pair[:user_id] == params[:user_id] 
				pushee = pair[:note_id]
				user_notes_ids.push(pushee)
			end

		end

		# get all notes 
		@user_notes_intermediate = Note.all 

		# get only notes for this user, as stored in @user_notes_ids
		@user_notes_intermediate.each do |note|

			if user_notes_ids.include? note[:id] 
				@user_notes.push(note)
			end

		end

		erb :index

	end 


	# new 

	get "/:user_id/new" do 

		@user = User.find params[:user_id]

		erb :new

	end


	# create 
	post "/:user_id" do



	end


	# view 
	get "/:user_id/:note_id" do 

		erb :view

	end


	# edit 
	get "/:user_id/:note_id/edit" do 

		erb :edit

	end


	# update 
	put "/:user_id/:note_id" do 


		redirect "/notes"

	end


	# destroy 
	delete "/:user_id/:note_id" do 

	end

end