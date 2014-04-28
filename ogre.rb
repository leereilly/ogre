require 'rubygems'
require 'sinatra'
require 'oily_png'
require 'open-uri'
require 'RMagick'
require 'octokit'

require './lib/url2png'
require './lib/startup'

get '/' do
  erb :index
end

get '/:user/?' do
  @user = Octokit.user params[:user]

  # create a local JPG
  open("public/user_jpgs/#{@user.login}.jpg", 'wb') do |file|
    file << open("#{@user.avatar_url}s=192").read
  end

  # convert JPG to PNG
  png_image = Magick::Image.read("public/user_jpgs/#{@user.login}.jpg").first
  png_image.format = "PNG"
  png_image.write("public/user_pngs/#{@user.login}.png")

  # add avatar to background
  background = ChunkyPNG::Image.from_file('public/background.png')
  user_image = ChunkyPNG::Image.from_file("public/user_pngs/#{@user.login}.png")
  background.compose!(user_image, 192, 290)
  background.save("public/user_og/#{@user.login}.png", :fast_rgba)

  # get user profile image
  options = {
    url:"https://github.com/#{@user.login}",
    thumbnail_max_width: 403,
    thumbnail_max_height: 252,
    viewport: "1100x700",
    fullpage: false,
    unique: Time.now.to_i / 60
  }

  profile_image_url = Url2png.new(options).url

  open("public/user_profiles/#{@user.login}.png", 'wb') do |file|
    file << open(profile_image_url).read
  end

  # add user profile to background (724x327)
  background = ChunkyPNG::Image.from_file("public/user_og/#{@user.login}.png"  )
  profile_image = ChunkyPNG::Image.from_file("public/user_profiles/#{@user.login}.png")
  background.compose!(profile_image, 724, 327)
  background.save("public/user_og/#{@user.login}.png", :fast_rgba)

  erb :user
end
