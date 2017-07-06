RSpec.describe "User visits '/trip-dashboard'" do
  it "and sees the dashboard" do
    visit 'trips/trip-dashboard'
    expect(page).to have_content("Trip Dashboard")
  end
end
