require 'rubygems'
require 'sinatra'
require 'oily_png'

get '/' do
  png = ChunkyPNG::Image.new(16, 16, ChunkyPNG::Color::TRANSPARENT)
  png[1,1] = ChunkyPNG::Color.rgba(10, 20, 30, 128)
  png[2,1] = ChunkyPNG::Color('black @ 0.5')
  png.save('test.png', :interlace => true)

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
