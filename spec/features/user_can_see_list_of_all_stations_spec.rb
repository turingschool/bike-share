describe "User visits '/stations'" do
  it "and sees the header of list of all stations" do
    visit('/stations')

    expect(page).to have_content("All Stations")
    expect(page).to have_content("Name")
    expect(page).to have_content("Dock Count")
    expect(page).to have_content("City")
    expect(page).to have_content("Installation Date")
    expect(page).to have_content("More Info")
    expect(page).to have_content("Edit")
    expect(page).to have_content("Delete")
  end
end