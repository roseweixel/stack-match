class WelcomeController < ApplicationController
  def index
    @feed = Feed.last || Feed.new
    render '/index'
    questions = JSON.load(open("https://api.stackexchange.com/2.2/questions?order=desc&sort=votes&tagged=ruby&site=stackoverflow"))
    binding.pry
  end

end