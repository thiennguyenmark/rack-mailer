require "erb"
require 'byebug'
require './config/setup'

class Application
  def self.call(env)
    new(env).response.finish
  end

  def initialize(env)
    @request = Rack::Request.new(env)
  end

  def response
    case @request.path
    when "/" then Rack::Response.new(render("index.html.erb"))
    when "/done" then
      Rack::Response.new(render("done.html.erb")) do
        puts '-----------> Your job will be excuted here'
        ContactJob.perform_async contact_object(@request.params)
      end
    else Rack::Response.new("Not Found", 404)
    end
  end

  def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  def contact_object(params)
    return {
      firstname: params['name'],
      lastname: params['surname'],
      email: params['email'],
      phone_number: params['phone_number'],
      message: params['message']
    }
  end
end
