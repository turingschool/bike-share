describe "User visits ''/stations/new'" do
  it "and can see create page without error" do
    visit('/stations/new')

    expect(page.status_code).to be(200)
    expect(page).to have_content("Name")
    expect(page).to have_content("Dock Count")
    expect(page).to have_content("City")
    expect(page).to have_content("Installation Date")
  end

  it "and can create a new station" do
    visit('/stations/new')

    within("form") do
      fill_in 'name', :with => 'Test Station'
      fill_in 'dockcount', :with => '12'
      fill_in 'installdate', :with => '2/2/2013'
      click_button "Create New Station"
    end

    save_and_open_page

    expect(page).to have_content("Test Station")
    expect(page).to have_content("Dock Count")
    expect(page).to have_content("12")
    expect(page).to have_content("City")
    expect(page).to have_content("San Jose")
    expect(page).to have_content("Installation Date")
  end
end