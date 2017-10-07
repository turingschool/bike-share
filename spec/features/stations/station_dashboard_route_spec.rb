require './spec/spec_helper'


feature 'When a user visits the Station Dashboard' do
  background do
    Station.create! name: 'boring!!!',        dock_count: 55,  installation_date: '5/5/5555', city: 'a', lat: 55.55, long: 55.55
    Station.create! name: 'boring!!!',        dock_count: 55,  installation_date: '5/5/5555', city: 'a', lat: 55.55, long: 55.55

    Station.create! name: 'fewest_docks_A',   dock_count: 1,   installation_date: '5/5/5555', city: 'a', lat: 55.55, long: 55.55
    Station.create! name: 'fewest_docks_B',   dock_count: 1,   installation_date: '5/5/5555', city: 'a', lat: 55.55, long: 55.55
    Station.create! name: 'most_docks_A',     dock_count: 999, installation_date: '5/5/5555', city: 'a', lat: 55.55, long: 55.55
    Station.create! name: 'most_docks_B',     dock_count: 999, installation_date: '5/5/5555', city: 'a', lat: 55.55, long: 55.55

    Station.create! name: 'boring!!!',        dock_count: 55,  installation_date: '5/5/5555', city: 'a', lat: 55.55, long: 55.55
    Station.create! name: 'boring!!!',        dock_count: 55,  installation_date: '5/5/5555', city: 'a', lat: 55.55, long: 55.55

    Station.create! name: 'old_A',            dock_count: 55,  installation_date: '5/5/5552', city: 'a', lat: 55.55, long: 55.55
    Station.create! name: 'old_B',            dock_count: 55,  installation_date: '5/5/5552', city: 'a', lat: 55.55, long: 55.55
    Station.create! name: 'new_A',            dock_count: 55,  installation_date: '5/5/5558', city: 'a', lat: 55.55, long: 55.55
    Station.create! name: 'new_B',            dock_count: 55,  installation_date: '5/5/5558', city: 'a', lat: 55.55, long: 55.55

    Station.create! name: 'boring!!!',        dock_count: 55, installation_date: '5/5/5555',  city: 'a', lat: 55.55, long: 55.55
    Station.create! name: 'boring!!!',        dock_count: 55, installation_date: '5/5/5555',  city: 'a', lat: 55.55, long: 55.55

    visit '/station-dashboard'
  end

  it 'has status code 200' do
    expect(page.status_code).to eq(200)
  end

  it 'they seen the total docks' do
    expect(page).to have_content(/total/i)
    expect(page).to have_content('14')
  end

  it 'they seen the average dock count' do
    expect(page).to have_content(/average bikes/i)
    expect(page).to have_content( '182' )
  end

  it 'they seen the stations with fewest docks' do
    expect(page).to have_content(/least bikes/i)
    expect(page).to have_content('fewest_docks_A')
    expect(page).to have_content('fewest_docks_B')
    expect(page).to have_content('1')
  end

  it 'they see the stations with most docks' do
    expect(page).to have_content(/most bikes/i)
    expect(page).to have_content('most_docks_A')
    expect(page).to have_content('most_docks_B')
    expect(page).to have_content('999')
  end

  it 'they see the oldest station(s)' do
    expect(page).to have_content(/oldest/i)
    expect(page).to have_content('old_A')
    expect(page).to have_content('old_B')
  end

  it 'they see the newest station(s)' do
    expect(page).to have_content(/newest/i)
    expect(page).to have_content('new_A')
    expect(page).to have_content('new_B')
  end

  it 'they see or don\'t see boring stations' do
    expect(page).not_to have_content('boring!!!')
  end

end
