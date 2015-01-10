class WelcomeController < ApplicationController
  def index
    @feed = Feed.last || Feed.new
    render '/index'
  end
end