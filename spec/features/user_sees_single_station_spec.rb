require_relative "../spec_helper"

RSpec.describe "When a user visits '/stations/:id' " do
  it "they see that bike station" do
    station1 = Station.create(name: "Turing", dock_count: 100, city: "Denver", installation_date: "3/14/2017")
    station2 = Station.create(name: "Galvanize", dock_count: 1, city: "Denver", installation_date: "4/01/1972")

    visit '/stations/2'

    within('h1') do
      expect(page).to have_content(station2.name)
    end
    expect(page).to have_content(station2.dock_count)
    expect(page).to have_content(station2.city)
    expect(page).to have_content(station2.installation_date)
  end

  it "they can click edit button" do
    station1 = Station.create(name: "Turing", dock_count: 100, city: "Denver", installation_date: "3/14/2017")
    station2 = Station.create(name: "Galvanize", dock_count: 1, city: "Denver", installation_date: "4/01/1972")

    visit '/stations/2'

    click_on 'edit'
    expect(current_path).to eq '/stations/2/edit'
  end

  it "they can click delete button" do
    station1 = Station.create(name: "Turing", dock_count: 100, city: "Denver", installation_date: "3/14/2017")
    station2 = Station.create(name: "Galvanize", dock_count: 1, city: "Denver", installation_date: "4/01/1972")

    visit '/stations/2'

    click_on 'Delete Station'
    expect(current_path).to eq '/stations'
  end
end
