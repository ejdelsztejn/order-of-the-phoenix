class PotterService
  def members(house)
    response = conn.get("characters?key=#{ENV['POTTER_API_KEY']}&orderOfThePhoenix=true&house=#{house}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://www.potterapi.com/v1/")
  end
end
