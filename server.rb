require 'sinatra/activerecord'
require 'sinatra'
set :port, 3000

set :database, {adapter: "sqlite3", database: "./doggly2.sqlite3"}


get '/' do
  erb :home
end

get '/signup' do
  erb :signup
end


post '/signup' do
  @user = User.new(params[:user])
  if @user.valid?
  @user.save
  redirect '/profile'
else
  redirect '/'
end
  p params
end
