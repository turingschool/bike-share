RSpec.describe "user clicks on stations hyperlink" do
  it "is rerouted to another page with four squares visible" do
    visit("/")
    click_link("stations")
    expect(page).to have_css("div h2.popup-first")
  end

  it "sees a button with 'view stations'" do
    visit('/station-dashboard')
    find(".btn-info").hover
    expect(page).to have_content(:button, "View Stations")
  end

  it "and button changes color when its hovered over" do
  end

  it "can click on the BS square top left" do

  end

  it "can see 'Average Number of Bikes' only when hovering" do

  end

  it "can scroll to see 'Newest' and 'Oldest' Stations" do

  end
end
