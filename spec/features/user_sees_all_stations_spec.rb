require './spec/spec_helper'

RSpec.describe "test bike share app" do

  it 'routs to station index' do
    Station.create(name: 'Lodo', city: 'Denver', dock_count: 56, install_date: '2010/08/13')

    visit('/stations')

    save_and_open_page

    expect(page).to have_content("Stations")
    expect(page).to have_content("Lodo")
    expect(page).to have_content("56")
    expect(page).to have_content("2010-08-13")
  end



  # describe "validations" do 
  #   it "is invalid without name"

end