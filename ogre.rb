require 'rubygems'
require 'sinatra'
require 'oily_png'

get '/' do
  background = ChunkyPNG::Image.from_file('background.png')
  blacktocat = ChunkyPNG::Image.from_file('leereilly.png')
  background.compose!(blacktocat, 420, 448)
  background.save('ogimage.png', :fast_rgba)

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
