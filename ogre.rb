require 'rubygems'
require 'sinatra'
require 'oily_png'

get '/' do
  background = ChunkyPNG::Image.from_file('filename.png')
  blacktocat = ChunkyPNG::Image.from_file('blacktocat.png')
  background.compose!(blacktocat, 10, 10)
  background.save('leereilly.png', :fast_rgba)

  erb :index
end

get '/:user/?' do
  @user = params[:user]

  erb :user
end

get '/:user/:repo/?' do
  @user = params[:user]
  @repo = params[:repo]

  erb :repo
end
