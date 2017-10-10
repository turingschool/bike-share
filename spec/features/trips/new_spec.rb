describe "/trips/new" do
  before :each do
    visit '/trips/new'
  end

it "user sees form with duration form field" do
  expect(page).to have_field("trip[duration]")
end

it "user sees form with start date form field" do
  expect(page).to have_field("trip[start_date]")
end

it "user sees form with start_station_id form field" do
  expect(page).to have_field("trip[start_station_id]")
end

it "user sees form with end date form field" do
  expect(page).to have_field("trip[end_date]")
end

it "user sees form with end station id form field" do
  expect(page).to have_field("trip[end_station_id]")
end

it "user sees form with bike id form field" do
  expect(page).to have_field("trip[bike_id]")
end

it "user sees form with subscription type form field" do
  expect(page).to have_field("trip[subscription_type]")
end

it "user sees form with zip code form field" do
  expect(page).to have_field("trip[zip_code]")
end

it "user can click submit button on form" do
  fill_in 'trip[duration]', with: 45
  fill_in 'trip[start_date]', with: '2014-10-15'
  fill_in 'trip[start_station_id]', with: 54
  fill_in 'trip[end_date]', with: '2014-10-15'
  fill_in 'trip[end_station_id]', with: 35
  fill_in 'trip[bike_id]', with: 53
  fill_in 'trip[subscription_type]', with: 'Paid'
  fill_in 'trip[zip_code]', with: 80325


  click_button("submit")

  expect(current_path).to eq('/trips')
end


end
