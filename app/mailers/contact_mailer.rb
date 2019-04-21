# frozen_string_literal: true
require './app/mailers/application_mailer'

class ContactMailer < ApplicationMailer
  def send_user_contact(contact)
    @item = contact
    mail(to: ENV['EMAIL_ADMIN_RECEIVER'], subject: @item[:subject])
  end
end
