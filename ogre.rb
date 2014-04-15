require 'rubygems'
require 'sinatra'

get '/:user/?' do
  @user = params[:user]
  erb :user
end

get '/:user/:repo/?' do
  @user = params[:user]
  @repo = params[:repo]
  erb :repo
end
