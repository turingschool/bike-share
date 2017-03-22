require "./spec/spec_helper"

RSpec.describe "As a user wants to edit a station" do
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
    expect(page).to have_content("Edit Station")
  end

  it "they can't submit when name field is empty" do
    visit '/stations/1'
    time = DateTime.now
    fill_in "city[name]", with: "New Amsterdam"
    fill_in "station[dock_count]", with: 16
    fill_in "station[installation_date]", with: time

    # click_on "Submit"
    expect( current_path ).to eq('/stations/1')
    expect(page).to have_content("Edit Station")
  end

  it "they can't submit when city field is empty" do
    visit '/stations/1'
    time = DateTime.now
    fill_in "station[name]", with: "Downtown"
    fill_in "station[dock_count]", with: 16
    fill_in "station[installation_date]", with: time

    # click_on "Submit"
    expect( current_path ).to eq('/stations/1')
    expect(page).to have_content("Edit Station")
  end

  it "they can't submit when dock_count field is empty" do
    visit '/stations/1'
    time = DateTime.now
    fill_in "station[name]", with: "Downtown"
    fill_in "city[name]", with: "New Amsterdam"
    fill_in "station[installation_date]", with: time

    # click_on "Submit"
    expect( current_path ).to eq('/stations/1')
    expect(page).to have_content("Edit Station")
  end

  it "they can't submit when installation_date field is empty" do
    visit '/stations/1'
    time = DateTime.now
    fill_in "station[name]", with: "Downtown"
    fill_in "city[name]", with: "New Amsterdam"
    fill_in "station[dock_count]", with: 16

    # click_on "Submit"
    expect( current_path ).to eq('/stations/1')
    expect(page).to have_content("Edit Station")
  end

  it "they can submit edited information" do
    visit '/stations/1'
    time = DateTime.now
    fill_in "station[name]", with: "New Downtown"
    fill_in "city[name]", with: "New Amsterdam"
    fill_in "station[dock_count]", with: 16
    fill_in "station[installation_date]", with: time


    click_on "Submit"

    expect( current_path ).to eq('/stations')

    expect(page).to have_content("New Downtown")
    expect(page).to have_content("New Amsterdam")
    expect(page).to have_content("16")
    expect(page).to have_content(Date.strptime(time.to_s, '%Y-%m-%d'))
  end

  # it "they can see edited station"

  # end


end
