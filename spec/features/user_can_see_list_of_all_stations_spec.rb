describe "User visits '/stations'" do
  it "and sees the station index without error" do
    visit('/stations')

    expect(page.status_code).to be(200)
    expect(page).to have_content("All Stations")
  end
end