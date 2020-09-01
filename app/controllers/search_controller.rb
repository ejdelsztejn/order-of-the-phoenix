class SearchController < ApplicationController
  def index
    house = params[:house]

    conn = Faraday.new(url: "https://www.potterapi.com/v1")

    response = conn.get("https://www.potterapi.com/v1/characters?key=#{ENV['POTTER_API_KEY']}&orderOfThePhoenix=true&house=#{house}")
    require "pry"; binding.pry
  end
end
