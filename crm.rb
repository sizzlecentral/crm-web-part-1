require_relative 'contact'
require 'sinatra'

get '/' do
  erb :index
end

get '/contacts' do

  @contacts = Contact.all
  erb(:contacts)


end


# ----- End of CRM routes ----- #

after do
  ActiveRecord::Base.connection.close
end
