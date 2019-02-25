class NoteController < ApplicationController 

	# landing
	get "/" do 

		@all_users = User.all.sort  

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

			if pair[:user_id].to_s == params[:user_id] 
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

		note = Note.new 

		note.content = params[:content]

		note.save 

		user_note = UserNotes.new 

		user_note.user_id = params[:user_id]

		user_note.note_id = note[:id]

		user_note.save 

		redirect "/notes/#{params[:user_id]}"

	end


	# show 
	get "/:user_id/:note_id" do 

		@user = User.find params[:user_id]

		@note = Note.find params[:note_id]

		erb :show

	end


	# edit 
	get "/:user_id/:note_id/edit" do 

		@user = User.find params[:user_id]

		@note = Note.find params[:note_id]

		erb :edit

	end


	# update 
	put "/:user_id/:note_id" do 

		note = Note.find params[:note_id]

		note.content = params[:content]

		note.save 

		redirect "/notes/#{params[:user_id]}"

	end


	# destroy 
	delete "/:user_id/:note_id" do 

		puts "============================="
		puts "============================="
		puts "============================="
		puts "============================="
		puts "DESTROY ROUTE STARTING"

		user_note = UserNotes.find_by note_id: params[:note_id]

		note = Note.find params[:note_id]

		puts "============================="
		puts "============================="
		puts "============================="
		puts "user_note: "
		pp user_note 

		puts "note: "
		pp note 
		puts "============================="
		puts "============================="
		puts "============================="


		user_note.destroy 

		note.destroy 

		redirect "/notes/#{params[:user_id]}"

	end

end