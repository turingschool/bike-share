describe "user travels to URI '/stations'" do
  it "shows a list of stations, information, and related buttons" do
    Station.create({name: "San Jose Diridon Caltrain Station",
                    dock_count: 27,
                    city: "San Jose",
                    installation_date: "8/6/2013"
                    })
    visit '/stations'

    within("h1") do
      expect(page).to have_content("All Stations")
    end
    within("a") do
      has_link?("San Jose Diridon Caltrain Station")
    end
    expect(has_button?("edit")).to be(true)
  end
end

describe "the route '/stations'" do
  it "gets you to the view with all stations listed" do

#TODO are my tests written correctly??
# => What is convention?
# => What parts of these tests are Capybara
# => What parts of these tests are RSpec
#TODO test below does not work?????
#form is not unique
# => change html?
# => change test?
# => use first("form")???
    # require 'pry'; binding.pry

  end
end
