require_relative 'contact'
require 'sinatra'

get '/' do
  erb :index
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/about' do
  erb :about
end


# ----- End of CRM routes ----- #

after do
  ActiveRecord::Base.connection.close
end
