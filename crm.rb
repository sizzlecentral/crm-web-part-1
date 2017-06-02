require_relative 'contact'
require 'sinatra'

get '/' do
  redirect to('/contacts')
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/about' do
  erb :about
end

get '/add-contact' do
  erb :add_contact 
end


# ----- End of CRM routes ----- #

after do
  ActiveRecord::Base.connection.close
end
