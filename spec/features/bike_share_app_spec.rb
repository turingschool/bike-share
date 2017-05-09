require './spec/spec_helper'

RSpec.describe "test bike share app" do
  Station.create(name: 'Aaron', city: 'Denver', dock_count: 56, install_date: '2010/08/13')

  it 'routs to station index' do

    visit('/stations')

    expect(page).to have_content("Stations")

  end

end
