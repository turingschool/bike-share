require './spec/spec_helper'

feature 'Create station page' do
  background { visit '/stations/new' }

  it 'has status code 200' do
    expect(page.status_code).to eq(200)
  end

  it 'has a form' do
    expect(page).to have_selector('form')
  end

  it 'has name field' do
    expect(page).to have_field('station[name]')
  end

  it 'has city field' do
    expect(page).to have_content(/city/i)
    expect(page).to have_field('station[city]')
  end

  it 'has dock count field' do
    expect(page).to have_content(/dock count/i)
    expect(page).to have_field('station[dock_count]')
  end

  it 'has latitude field' do
    expect(page).to have_content(/latitude/i)
    expect(page).to have_field('station[lat]')
  end

  it 'has longetude field' do
    expect(page).to have_content(/longetude/i)
    expect(page).to have_field('station[long]')
  end

  it 'has installation date field' do
    expect(page).to have_content(/installation date/i)
    expect(page).to have_field('station[installation_date]')
  end

end
