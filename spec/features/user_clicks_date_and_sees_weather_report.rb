RSpec.describe "User clicks date button" do
  it "on conditions page" do

    visit('/conditions')

    click_link("2013-08-29")

    expect(page).to have_content("max temperature")
  end
end
