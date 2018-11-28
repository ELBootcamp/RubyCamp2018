require 'sinatra'
require './name_getter'

get '/' do
  begin
    @name = NameGetter.new(params[:name]).call if params[:name]
  rescue SomeError
    @name = 'Invalid name, dude!'
  rescue NameNilError
    @name = 'Name can\'t be blank.'
  end
  erb :hello
end
