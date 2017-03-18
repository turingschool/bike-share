require_relative '../spec_helper'


RSpec.describe "When a user visits '/show'" do
  it 'they see a single station' do

    Station.create(name: 'Turing Station', dock_count: 12, city: 'Denver', installation_date: Date.parse('8/6/2013'))

    visit '/stations/1'

    within('h2.title') do
      expect(page).to have_content('Turing Station')
    end

    within('p') do
      expect(page).to have_content(12)
    end

    within('p') do
      expect(page).to have_content('Denver')
    end

    within('p') do
      expect(page).to have_content('8/6/2013')
    end
  end
end
