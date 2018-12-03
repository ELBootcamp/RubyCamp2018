require 'sinatra'
require './lib/greet_maker'

get '/' do
  begin
    @greeting_message = GreetMaker.new(params[:name]).make_greet if params[:name]
  rescue NameNilError
    @greeting_message = "Name can't be blank"
  rescue 
    @greeting_message = "Very funny, dude!"
  end
  erb :main_page
end
