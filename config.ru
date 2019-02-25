require 'sinatra/base'

# controllers:
require './controllers/ApplicationController'
require './controllers/NoteController'
require './controllers/UserController'

# models 
require './models/NoteModel'
require './models/UserModel'
require './models/UserNotesModel'


map ('/') {
	run ApplicationController
}

map ('/users') {
	run UserController 
}

map ('/notes') {
	run NoteController
}
