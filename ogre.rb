require 'rubygems'
require 'sinatra'
require 'oily_png'
require 'open-uri'
require 'rmagick'
require 'octokit'

require './lib/url2png'
require './lib/startup'

get '/' do
  background = ChunkyPNG::Image.from_file('background.png')
  blacktocat = ChunkyPNG::Image.from_file('leereilly.png')
  background.compose!(blacktocat, 420, 448)
  background.save('ogimage.png', :fast_rgba)

  erb :index
end

get '/:user/?' do
  @user = Octokit.user params[:user]

  # create a local JPG
  open("public/user_jpgs/#{@user.login}.jpg", 'wb') do |file|
    file << open("#{@user.avatar_url}s=82").read
  end

  # convert to PNG
  # image = MiniMagick::Image.open("public/user_jpgs/#{@user.login}.jpg")
  # image.write "public/user_pngs/#{@user.login}.png"
  thumb = Magick::Image.read("public/user_jpgs/#{@user.login}.jpg").first
  thumb.format = "PNG"
  thumb.write("public/user_pngs/#{@user.login}.png")

  # add avatar to background
  background = ChunkyPNG::Image.from_file('background.png')
  user_image = ChunkyPNG::Image.from_file("public/user_pngs/#{@user.login}.png")
  background.compose!(user_image, 420, 448)
  background.save("public/user_og/#{@user.login}.png", :fast_rgba)

  # get user profile image
  options = {
    url:"https://github.com/#{@user.login}",
    thumbnail_max_width: 500,
    viewport: "1480x1037",
    fullpage: true,
    unique: Time.now.to_i / 60       # forces a unique request at most once an hour
  }

  @profile_image_url = Url2png.new(options).url

  erb :user
end

get '/:user/:repo/?' do
  @user = params[:user]
  @repo = params[:repo]

  erb :repo
end
