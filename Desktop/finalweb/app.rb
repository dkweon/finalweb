# app.rb

# use bundler
require 'rubygems'
require 'bundler/setup'
# load all of the gems in the gemfile
Bundler.require

require './models/User'
require './models/Photo'
require './models/Album'


# enable cookie-based sessions
enable :sessions
# set a secret used to encrypt the session cookie
# NOTE: best practice would be to store this value in
# an enviroment variable like ENV['SESSION_SECRET'] so
# that it's not checked in with our source code. For
# simplicity's sake, I'm not doing that here (but that means
# that anyone who can see this source code would be able to
# spoof cookies for this application)
set :session_secret, '95txrIIvTDe0AWPCvbeXuXXpULCWZgpoRo1LqY8YsR9GAbph0jfOHosvtY4QFxi6'



if ENV['DATABASE_URL']
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
else
  ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => 'db/development.db',
  :encoding => 'utf8'
  )
end

# define a route for the root of the site

before do
  @user = User.find_by(userid: session[:name])
end

### GET ###

get '/' do
  if @user
    @albums = @user.albums.order(:name)
    erb :album_list
  else
    erb :login
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/:user' do
  @all_albums = Album.all.order(:name)
  erb :album_list
end

get '/:user/:album' do
  @album = Album.find(params[:name])
  @all_photos = @album.albums.order(:duw)
  erb :photo_list
end

### POST ###

post '/new_user' do
  @user = User.create(params)
  if @user.valid?
    session[:name] = @user.name
    redirect '/'
  else
    @message = @user.errors.full_messages.join(', ')
    erb :message_page
  end
end

post '/new_album' do
  @user.albums.create(name: params[:name], picture: params[:picture])
  redirect "/"
end


post '/new_photo' do
  @user.albums.create(name: params[:name], picture: params[:picture])
  @album = photos.create(picture: params[:picture], description: params[:description], date: params[:date])
  #Album.find(params[:album]).photos.create(picture: params[:picture], description: params[:description], date: params[:date])
  redirect "/#{params[:album]}"
end

post '/login' do
  user = User.find_by(name: params[:name])

  if user.nil?
    @message = "User not found."
    session[:name] = user.names
    erb :message_page
    redirect '/'
  end
end

### DELETE ###

get '/:album/delete/:photo' do
  Photo.find(params[:photo]).destroy
  redirect "/#{params[:album]}"
end

get '/delete_user' do
  @user.destroy
  redirect '/'
end

get '/delete_album/:album' do
  @album_list = Album.find(params[:album])
  @user = @album_list.user
  @album_list.destroy
  redirect "/"
end
