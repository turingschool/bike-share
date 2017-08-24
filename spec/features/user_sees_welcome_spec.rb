describe "User visits '/'" do
  it "and sees a welcome message" do

    visit '/'

    expect(page).to have_content("San Francisco Bike Share")
    expect(page).to have_content("Conditions")
    expect(page).to have_content("Trips")
    expect(page).to have_content("Stations")
  end
end
