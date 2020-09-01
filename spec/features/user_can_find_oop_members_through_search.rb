require 'rails_helper'

# As a user,
feature "user can search for Order of the Phoenix members" do
  scenario "user selects valid house name" do
    # When I visit "/"
    visit '/'

    # And I Select "Gryffindor" from the select field
    select 'Gryffindor', from: :house

    # And I click "Search For Members"
    click_on 'Search For Members'

    # Then I should be on page "/search"
    expect(current_path).to eq(search_path)

    # Then I should see the total number of the order of the phoenix members that belong to Gryffindor. (i.e. 21)
    expect(page).to have_content("21 Results")
    expect(page).to have_css(".member", count: 21)

    # And I should see a list with the detailed information for the 21 members of the Order of the Phoenix for house Gryffindor.
    # And for each of the members I should see:
    # - The name of the member
    # - The members role (if it exists)
    # - The house the member belongs to
    # - The Patronus of the member (if it exists)
    within(first(".member")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".role")
      expect(page).to have_css(".house")
      expect(page).to have_css(".patronus")
    end
  end
end
