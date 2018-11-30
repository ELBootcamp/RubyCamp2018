require 'sinatra'
require './lib/greet_maker'

get '/' do
  @greeting_message = GreetMaker.new(params[:name]).make_greet if params[:name]
  erb :main_page
end
