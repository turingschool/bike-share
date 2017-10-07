require './spec/spec_helper'

feature 'When a user visits the create station page' do
  background { visit '/stations/new' }

  it 'has status code 200' do
    expect(page.status_code).to eq(200)
  end

  it 'they see a form' do
    expect(page).to have_selector('form')
  end

  it 'they see city field' do
    expect(page).to have_content(/city/i)
    expect(page).to have_field('city')
  end

  it 'they see name field' do
    expect(page).to have_content(/name/i)
    expect(page).to have_field('name')
  end

  it 'they see dock count field' do
    expect(page).to have_content(/dock count/i)
    expect(page).to have_field('dock_count')
  end

  it 'they see latitude field' do
    expect(page).to have_content(/latitude/i)
    expect(page).to have_field('lat')
  end

  it 'they see longitude field' do
    expect(page).to have_content(/longitude/i)
    expect(page).to have_field('long')
  end

  it 'they see installation date field' do
    expect(page).to have_content(/installation date/i)
    expect(page).to have_field('installation_date')
  end

end
