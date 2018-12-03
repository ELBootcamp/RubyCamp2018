require 'sinatra'
require './lib/nokia_texter'

get '/' do
  begin
    @transformed_message = NokiaTexter.new(params[:text]).squeeze if params[:text]
  rescue MessageTooLong
    @transformed_message = "Message too long. Message needs to be shorter than 160 characters"
  end
  erb :main_page
end