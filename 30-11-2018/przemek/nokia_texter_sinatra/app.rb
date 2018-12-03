require 'sinatra'
require "sinatra/reloader" if development?
require_relative 'lib/nokia_texter'

get '/' do
  begin
    @nokia_text = NokiaTexter.new(params[:text]).squeeze
  rescue ArgumentError
    @nokia_text = ''
  rescue MethodToLong
    @nokia_text = "Won't fit into single sms"
  end
  erb :index
end