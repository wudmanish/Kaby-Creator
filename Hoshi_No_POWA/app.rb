require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration
require './models/user'
require './models/post'


set :port, 8080
set :static, true
set :bind, '0.0.0.0'

#index controllers
get '/' do
    erb :index
end

#user controllers
post '/submit_user' do
	@user = User.new(params[:user])
	if @user.save
		redirect '/users'
	else
		"Sorry, there was an error!"
	end
end

get '/create_user' do
	erb :create_user
end

get '/users' do
	@users = User.all
	erb :users
end

#tweet controllers
post '/submit_posts' do
	@post= Posts.new(params[:post])
	if @post.save
		redirect '/posts'
	else
		"Sorry, there was an error!"
	end
end


get '/create_post' do
	erb :create_post
end

get '/posts' do
	@post = Post.all
	@users = User.all
	erb :post
end

before do 
    @defeat = {rock: :scissor, paper: :rock, scissors: :paper}
    @throws = @defeat.keys
end

#Registrations 
get '/registrations/signup' do
    erb :'/registrations/signup'
end

post '/registrations' do
	@user = User.new(params[:user])
	if @user.save
		redirect '/sessions/login'
	else
		"Sorry, there was an error!"
	end
end

#sessions and login management
get '/sessions/login' do
	erb :'/sessions/login'
end

post '/sessions' do
	@user = User.find_by(email: params["email"], password: params["password"])
	if @user != nil
		session[:id] = @user.id
		redirect '/users/home'
	else
		redirect 'sessions/login'
	end
end

get '/sessions/logout' do
	session.clear
	redirect '/'
end

#users home 
get '/users/home' do
  @user = User.find(session[:id])

  erb :'/users/home'
end

#pow controllers
post '/pick_pow' do
	@pow = POW.new(params[:user])
	if @pow.save
		redirect '/pick_pow'
	else
		"Sorry, there was an error!"
	end
end

get '/throw/:type' do
    # the params[] hash stores query string and form data.
    player_throw = params[:type].to_sym
    
    
    #in the case of a player providing a throw that is not valid
    #we halt with a status code 403 (Forbidden) and let them
    #know they need to make a valid throw to play.
    if !@throws.include?(player_throw)
        halt 403, "You must throw one of the following: #{@throws}"
    end
    
    #now we can select a random throw for the computer
    computer_throw = @throws.sample
    
    #compare the player and computer throws to determine a winner
    if player_throw == @throws[2]
        erb :pick_pow
        #"You tied with the computer. Try again!"
    elsif player_throw == @throws[0]
        erb :pick_pow, :locals => {:computer_throw => computer_throw, :player_throw => player_throw}
        #"Nicely done; #{player_throw} beats #{computer_throw}"
    elsif player_throw == @throws[1]
        erb :pick_pow, :locals => {:computer_throw => computer_throw, :player_throw => player_throw}
        #"Ouch; #{computer_throw} beats #{player_throw}. Better luck next time!"
    end
end

