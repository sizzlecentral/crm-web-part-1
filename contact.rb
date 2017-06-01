gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text

  def full_name
    "#{first_name} #{last_name}"
  end

# ----- Old code below ----- #
#   attr_reader :id
#   attr_accessor :first_name, :last_name, :email, :note
#
#   @@contacts = []
#   @@id = 1
#
#   # This method should initialize the contact's attributes
#   def initialize(first_name, last_name, email, note)
#     @first_name = first_name
#     @last_name = last_name
#     @email = email
#     @note = note
#     @id = @@id
#     @@id += 1
#   end
#
# # ----- Class Methods ----- #
#
#   # This method should call the initializer,
#   # store the newly created contact, and then return it
#   def self.create(first_name, last_name, email, note)
#     contact = Contact.new(first_name, last_name, email, note)
#     @@contacts << contact
#     return contact
#   end
#
#   # This method should return all of the existing contacts
#   def self.all
#     @@contacts
#   end
#
#   # This method should accept an id as an argument
#   # and return the contact who has that id
#   def self.find(id)
#     @@contacts.find do |contact|
#       id == contact.id
#     end
#   end
#
#   # This method should work similarly to the find method above
#   # but it should allow you to search for a contact using attributes other than id
#   # by specifying both the name of the attribute and the value
#   # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
#   def self.find_by(attribute, value)
#     result = @@contacts.select do |contact|
#       contact.send(attribute) == value
#     end
#     return result[0]
#   end
#
#   # This method should delete all of the contacts
#   def self.delete_all
#     @@contacts.clear
#   end
#
#
# # ----- Instance Methods ----- #
#
#   def full_name
#     "#{first_name} #{last_name}"
#   end
#
#   # This method should allow you to specify
#   # 1. which of the contact's attributes you want to update
#   # 2. the new value for that attribute
#   # and then make the appropriate change to the contact
#   def update(attribute, value)
#     case attribute
#     when "first name"
#       self.first_name = value
#     when "last name"
#       self.last_name = value
#     when "email"
#       self.email = value
#     when "note"
#       self.note = value
#     end
#   end
#
#   # This method should delete the contact
#   # HINT: Check the Array class docs for built-in methods that might be useful here
#   def delete
#     @@contacts.each do |contact|
#       if contact == self
#         @@contacts.delete(contact)
#       end
#     end
#   end
#
#   # Feel free to add other methods here, if you need them.
end

Contact.auto_upgrade!

# ----- End of Contact class ----- #

# instantiate = Contact.create("Bob", "Jones", "bob@jones.com", "Bob is cool.")
# sally = Contact.create("Sally", "Smith", "sally@smith.com", "Sally is okay.")

# p Contact.all
# p Contact.find(2)
# p Contact.find_by("email", "bob@jones.com")
# Contact.delete_all
# p Contact.all
# p sally.full_name
# sally.update("first_name", "Sue")
# p sally.full_name
# sally.delete
# p Contact.all
