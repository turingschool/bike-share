require './spec/spec_helper'

feature 'When a user visits the create station page' do
  background { visit '/stations/new' }

  it 'has status code 200' do
    expect(page.status_code).to eq(200)
  end

  it 'they see a form' do
    expect(page).to have_selector('form')
  end


  it 'they see a name field' do
    expect(page).to have_field('station[name]')
  end

  it 'they see a city field' do
    expect(page).to have_content(/city/i)
    expect(page).to have_field('station[city]')
  end

  it 'they see dock count field' do
    expect(page).to have_content(/dock count/i)
    expect(page).to have_field('station[dock_count]')
  end

  it 'they see latitude field' do
    expect(page).to have_content(/latitude/i)
    expect(page).to have_field('station[lat]')
  end

  it 'they see the longitude field' do
    expect(page).to have_content(/longitude/i)
    expect(page).to have_field('station[long]')
  end

  it 'they see installation date field' do
    expect(page).to have_content(/installation date/i)
    expect(page).to have_field('station[installation_date]')
  end

  it 'they see a submit button' do
    expect(page).to have_selector('input[type=submit]')
  end

end
