# frozen_string_literal: true
require "action_mailer"

class ApplicationMailer < ActionMailer::Base
  default from: ENV['FROM_EMAIL']
  layout 'mailer'
end
