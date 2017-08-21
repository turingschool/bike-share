

describe "create a new condition" do
  it "can visit new page page" do

  visit '/conditions/new'

  expect(current_path).to eq('/conditions/new')
  expect(page).to have_content("Date")
  expect(page).to have_content("Max Temperature")
  expect(page).to have_content("Min Temperature")
  expect(page).to have_content("Mean Humidity")
  expect(page).to have_content("Mean Visibility")
  expect(page).to have_content("Mean Wind Speed")
  expect(page).to have_content("Precipitation (in)")

  end
end

