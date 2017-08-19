describe 'User can view station dashboard' do
  it 'and see the analytics' do
    Station.create(name: "San Jose Civic Center", dock_count: 30, city: "San Jose", installation_date: "8/15/13")

    visit '/station-dashboard'

    expect(page).to have_content("Station Analytics")
    expect(page).to have_content("Average Bikes Available (Per Station):")
    expect(page).to have_content("Most Bikes Available at a Station:")
    expect(page).to have_content("Station with most bikes available:")
    expect(page).to have_content("Least Bikes Available at a Station:")
    expect(page).to have_content("Station with fewest bikes available:")
    expect(page).to have_content("Newest Station:")
    expect(page).to have_content("Oldest Station:")
  end
end
