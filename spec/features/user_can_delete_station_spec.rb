require "./spec/spec_helper"

RSpec.describe "As a user wants to delete a station" do
	it "they can view station on the page" do
    time = DateTime.now
    City.create(name: "Amsterdam")
    Station.create(name: "Downtown", dock_count: 15, city_id: 1, installation_date: time)


		visit '/stations'

		expect( current_path ).to eq('/stations')
		expect(page).to have_content("Downtown")
		expect(page).to have_content("15")
		expect(page).to have_content("Amsterdam")
		expect(page).to have_content(Date.strptime(time.to_s, '%Y-%m-%d'))
		expect(page).to have_content("View & Edit")

	end

  it "they can go to edit page" do
    visit '/stations'

    click_on "View & Edit"
    expect( current_path ).to eq('/stations/1')
    # expect(page).to have_content("Edit Station")
  end

  it "they can click delete" do
    visit '/stations'

    click_on "View & Edit"
    click_on "Delete"
    expect( current_path ).to eq('/stations')
    # expect(page).to have_content("Edit Station")
  end

  it "they do not see deleted station" do
    visit '/stations'

    expect( current_path ).to eq('/stations')
    expect(page).to have_no_content("Downtown")
    expect(page).to have_no_content("15")
    expect(page).to have_no_content("Amsterdam")
    expect(page).to have_no_content("View & Edit")
    end

end
