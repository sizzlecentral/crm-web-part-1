require_relative 'contact'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  redirect to('/contacts')
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :contact
end


get '/about' do
  erb :about
end

get '/add_contact' do
  erb :add_contact
end

get '/delete_contact/:id' do
  @contact = Contact.find(params[:id])
  erb :delete_contact
end

delete '/delete_contact/:id' do
  @contact = Contact.delete(params[:id])
  redirect to("/")
end

get '/update_contact/:id' do
  @contact = Contact.find(params[:id])
  erb :update_contact
end

put '/update_contact/:id' do
  @contact = Contact.find(params[:id])
  @contact.update(params[:contact])
  redirect to("/contacts/#{params[:id]}")
end

# ----- End of CRM routes ----- #

after do
  ActiveRecord::Base.connection.close
end
