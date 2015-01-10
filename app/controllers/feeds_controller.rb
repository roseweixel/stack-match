require 'open-uri'
require 'rss'

class FeedsController < ApplicationController
  def create
    @search_term = params[:feed][:search_term]
    #binding.pry
    @url = "http://careers.stackoverflow.com/jobs/feed?searchTerm=#{@search_term}"
    @results = RSS::Parser.parse(open(@url).read, false)
    #binding.pry
    Feed.create(search_term: @search_term, results: @results)
    binding.pry
    redirect_to(:back)
  end

  # private

    # def feed_params
    #   params.require(:feed).permit(:search_term)
    # end
end