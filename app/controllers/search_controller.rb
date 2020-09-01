class SearchController < ApplicationController
  def index
    house = params[:house]

    conn = Faraday.new(url: "https://www.potterapi.com/v1")

    # why do I have to put the whole URL in below? Something to investigate
    response = conn.get("https://www.potterapi.com/v1/characters?key=#{ENV['POTTER_API_KEY']}&orderOfThePhoenix=true&house=#{house}")

    json = JSON.parse(response.body, symbolize_names: true)
    @members = json
  end
end
