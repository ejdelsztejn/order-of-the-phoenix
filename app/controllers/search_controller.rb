class SearchController < ApplicationController
  def index
    house = params[:house]

    potter_facade = PotterFacade.new(house)
    @members = potter_facade.find_members
  end
end
