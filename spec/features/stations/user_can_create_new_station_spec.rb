require_relative "../../spec_helper"

RSpec.describe "When a user creates a station" do
  it "the station shows up in the index" do

    visit '/stations/new'
    fill_in 'station[name]', with: 'Turing'
    fill_in 'station[city]', with: 'Denver'
    fill_in 'station[dock_count]', with: 100
    fill_in 'station[installation_date]', with: '14/3/2017'
    click_on 'Submit'

    expect(current_path).to eq '/stations/1'
    expect(page).to have_content 'Turing'
    expect(page).to have_content 'Denver'
  end
end
