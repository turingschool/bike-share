require './spec/spec_helper'
require './app/models/station'


feature 'Not Found page' do

  background do
    visit '/so_fake'
  end

  it 'has status code 404' do
    expect(page.status_code).to eq 404
  end

  it 'has informative text' do
    expect(page).to have_content(/not found/i)
  end

end
