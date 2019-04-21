require 'sidekiq'
require './app/mailers/contact_mailer'
require 'pg'

class ContactJob
  include Sidekiq::Worker
  def perform(contact_object)
    puts "-------------> This is my mail job"
    puts "-------------> First Name: #{contact_object['firstname']}"
    puts "-------------> Last Name: #{contact_object['lastname']}"
    puts "-------------> Email: #{contact_object['email']}"
    puts "-------------> Phone Number: #{contact_object['phone_numbe']}"
    puts "-------------> Message: #{contact_object['message']}"
    insert_detail_mail_to_db contact_object

  end

  def insert_detail_mail_to_db(contact_object)
    conn = PG.connect( dbname: 'rackup' )
    conn.exec "INSERT INTO users VALUES('#{contact_object['firstname']}',
                                        '#{contact_object['lastname']}',
                                        '#{contact_object['email']}',
                                        '#{contact_object['phone_number']}',
                                        '#{contact_object['message']}')"
  rescue PG::Error => e
    puts e.message
  ensure
    conn.close if conn
  end
end
