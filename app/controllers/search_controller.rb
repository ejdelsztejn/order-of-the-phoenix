class SearchController < ApplicationController
  def index
    house = params[:house]

    conn = Faraday.new(url: "https://www.potterapi.com/v1/")
    
  end
end
