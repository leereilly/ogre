require 'rubygems'
require 'sinatra'
require 'oily_png'

#          __,='`````'=/__
#         '//  (o) \(o) \ `'         _,-,
#         //|     ,_)   (`\      ,-'`_,-\
#       ,-~~~\  `'==='  /-,      \==```` \__
#      /        `----'     `\     \       \/
#   ,-`                  ,   \  ,.-\       \
#  /      ,               \,-`\`_,-`\_,..--'\
# ,`    ,/,              ,>,   )     \--`````\
# (      `\`---'`  `-,-'`_,<   \      \_,.--'`
#  `.      `--. _,-'`_,-`  |    \
#   [`-.___   <`_,-'`------(    /
#   (`` _,-\   \ --`````````|--`
#    >-`_,-`\,-` ,          |
#  <`_,'     ,  /\          /
#   `  \/\,-/ `/  \/`\_/V\_/
#      (  ._. )    ( .__. )
#      |      |    |      |
#       \,---_|    |_---./
#       ooOO(_)    (_)OOoo

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
