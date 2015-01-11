# require 'open-uri'
# require 'rss'

class FeedsController < ApplicationController
  def create
    search_term = params[:feed][:search_term].gsub(" ", "+")
    if params[:feed][:location]
      location = params[:feed][:location].gsub(" ", "+")
      url = "http://careers.stackoverflow.com/jobs/feed?searchTerm=#{search_term}&location=#{location}&range=20&distanceUnits=Miles"
    else
      url = "http://careers.stackoverflow.com/jobs/feed?searchTerm=#{search_term}"
    end
    results = RSS::Parser.parse(open(url).read, false)

    feed = Feed.new(feed_params)
    feed.results = results
    feed.save

    redirect_to(:back)
  end

  def update
    search_term = params[:feed][:search_term].gsub(" ", "+")
    if params[:feed][:location]
      location = params[:feed][:location].gsub(" ", "+")
      url = "http://careers.stackoverflow.com/jobs/feed?searchTerm=#{search_term}&location=#{location}&range=20&distanceUnits=Miles"
    else
      url = "http://careers.stackoverflow.com/jobs/feed?searchTerm=#{search_term}"
    end
    results = RSS::Parser.parse(open(url).read, false)

    feed = Feed.new(feed_params)
    feed.results = results
    feed.save
    
    redirect_to(:back)
  end

  private

    def feed_params
      params.require(:feed).permit(:search_term, :location)
    end
end