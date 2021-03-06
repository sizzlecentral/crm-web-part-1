require_relative 'contact'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  redirect to('/contacts')
end

not_found do
  status 404
  erb :not_found
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/contacts/:id' do
  @contact = Contact.find_by(:id =>params[:id])
  if @contact
    erb :contact
  else
    erb :not_found
  end
end

get '/about' do
  erb :about
end

get '/add_contact' do
  erb :add_contact
end

post '/add_contact/' do
  @contact = Contact.create(params[:contact])
  redirect to('/contacts')
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

get '/search_results/' do
  @contacts = Contact.where(:first_name =>params[:first_name])
  if @contacts.any? == true
    erb :search_results
  else
    erb :not_found
  end
end

# ----- End of CRM routes ----- #

after do
  ActiveRecord::Base.connection.close
end
