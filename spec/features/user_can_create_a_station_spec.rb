require "./spec/spec_helper"

RSpec.describe "As a user wants to create a station" do
	it "they can enter station attributes and see it on the page" do
		time = DateTime.now
		visit '/stations/new'
		fill_in "station[name]", with: "Downtown"
		fill_in "city[name]", with: "Amsterdam"
		fill_in "station[dock_count]", with: 15
		fill_in "station[installation_date]", with: time

		click_on "Submit" #explore selectors

		expect( current_path ).to eq('/stations')
		expect(page).to have_content("Downtown")
		expect(page).to have_content("Dock Count: 15")
		expect(page).to have_content("City: Amsterdam")
		expect(page).to have_content("Installation Date: #{time.to_date.to_s}")

	end

  it "they can't submit when name field is empty" do
    time = DateTime.now
    visit '/stations/new'
    fill_in "city[name]", with: "Amsterdam"
    fill_in "station[dock_count]", with: 15
    fill_in "station[installation_date]", with: time

    click_on "Submit"

    expect( current_path ).to eq('/stations/new')
    expect(page).to have_content("Create a New Station")
  end

  it "they can't submit when city field is empty" do
    time = DateTime.now
    visit '/stations/new'
    fill_in "station[name]", with: "Station 235"
    fill_in "station[dock_count]", with: 15
    fill_in "station[installation_date]", with: time

    click_on "Submit"

    expect( current_path ).to eq('/stations/new')
    expect(page).to have_content("Create a New Station")
  end

  it "they can't submit when dock_count field is empty" do
    time = DateTime.now
    visit '/stations/new'
    fill_in "station[name]", with: "Amsterdam"
    fill_in "city[name]", with: "NYC"
    fill_in "station[installation_date]", with: time

    click_on "Submit"

    expect( current_path ).to eq('/stations/new')
    expect(page).to have_content("Create a New Station")
  end

  it "they can't submit when installation_date field is empty" do
    time = DateTime.now
    visit '/stations/new'
    fill_in "station[name]", with: "Billy"
    fill_in "city[name]", with: "Amsterdam"
    fill_in "station[dock_count]", with: 15

    click_on "Submit"

    expect( current_path ).to eq('/stations/new')
    expect(page).to have_content("Create a New Station")
  end


end
