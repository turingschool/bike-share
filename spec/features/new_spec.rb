describe "/stations/new" do
  before :each do
    visit '/stations/new'
  end

it "user sees form with name field" do
  expect(page).to have_field("station[name]")
end

it "user sees form with dock count field" do
  expect(page).to have_field('station[dock_count]')
end

it "user sees form with city field" do
  expect(page).to have_field("station[city_id]")
end

it "user sees form with installation date field" do
  expect(page).to have_field("station[installation_date]" )
end

it "user can click submit button on form" do
  fill_in 'station[name]', with: 'Cowabunga'
  fill_in 'station[dock_count]', with: '17'
  fill_in 'station[installation_date]', with: '2014-10-15'

  click_button("submit")

  expect(current_path).to eq('/stations')
end

    #redirect valdiation

    #invalid data validation

end
