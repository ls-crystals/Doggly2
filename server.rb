require 'sinatra/activerecord'
require 'sinatra'
require 'sinatra/flah'
set :port, 3000

set :database, {adapter: "sqlite3", database: "./doggly2.sqlite3"}


get '/' do
  erb :home
end


get '/login' do
  erb :login
end

post 'login' do
  user = User.find_by(email: params[:email])
  given_pasword = params[:password]
  if user.password. == given_password
    session[:user_id]user.id
    redirect '/profile'
  else
    flash[:error] = "Correct email, but wrong password. Did you mean: #{user.password}?"
    redirect '/signup'
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
  flash[:error] = @user.errors.full_messages

 end
  p params
end



get '/profile' do
  erb :profile
end
