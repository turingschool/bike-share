require "spec_helper"

RSpec.describe "When a user visits '/conditions/:id'" do

  let(:condition) do
    Condition.create!(
      date: Date.new(2013,8,28),
      max_temperature_f: 70,
      min_temperature_f: 40,
      mean_temperature_f: 60,
      mean_humidity: 30,
      mean_visibility_miles: 10,
      mean_wind_speed_mph: 4 ,
      precipitation_inches: 1,
      zip_code: 95234)
  end

  before do
    visit "/conditions/#{condition.id}"
  end

  it "they see a date" do
    expect(page).to have_content("8/28/2013")
  end

  it "they see max temperature" do
    expect(page).to have_content(70)
  end

  it "they see min temperature:" do
    expect(page).to have_content(40)
  end

  it "they see mean temperature f" do
    expect(page).to have_content(60)
  end

  it "they see mean humidity" do
    expect(page).to have_content(60)
  end

  it "they see mean visibility miles" do
    expect(page).to have_content(10)
  end

  it "they see mean wind speed mph" do
    expect(page).to have_content(4)
  end
end
