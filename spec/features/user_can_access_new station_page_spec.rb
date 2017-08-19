describe "User can access new station page" do
  it "and view form to create new station" do

    visit '/stations/new'

    page.has_content?('Name')
    page.has_content?('Dock Count')
    page.has_content?('City')
    page.has_content?('Installation Date')
  end
  it "and create a new station" do

    visit '/stations/new'

    fill_in("station[name]", with: "Turing")
    fill_in("station[dock_count]", with: 10)
    fill_in("station[city]", with: "Denver")
    fill_in("station[installation_date]", with: "08/18/17")
    click_on("Create New Station")

    expect(page).to have_content("Turing")
    expect(page).to have_content("10")
    expect(page).to have_content("Denver")
    expect(page).to have_content("08/18/17")
    expect(current_path).to eq('/stations/1')
  end
end
