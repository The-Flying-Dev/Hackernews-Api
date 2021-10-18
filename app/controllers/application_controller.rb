class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #all controllers have access now
  def client
    @client ||= Hackernews::Client.new
  end
end
