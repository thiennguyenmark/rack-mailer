require 'sidekiq'

class ContactJob
  include Sidekiq::Worker
  def perform(contact_object)
    puts "-------------> This is my mail job"
    puts "-------------> First Name: #{contact_object['firstname']}"
    puts "-------------> Last Name: #{contact_object['lastname']}"
    puts "-------------> Email: #{contact_object['email']}"
    puts "-------------> Phone Number: #{contact_object['phone_numbe']}"
    puts "-------------> Message: #{contact_object['message']}"
  end
end
