class PotterFacade
  def initialize(house)
    @house = house
    @potter_service ||= PotterService.new
  end

  def find_members
    member_data = get_member_data
    member_data.map do |info|
      Member.new(info)
    end
  end

  def get_member_data
    @potter_service.members(@house)
  end
end
