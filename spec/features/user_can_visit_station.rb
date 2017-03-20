require_relative '../spec_helper'

RSpec.describe "A user can visit a station" do
  it "they can click on a station name and be redirected to that station" do
    visit '/stations'
      click_on (page.all('a')[1])
      expect(current_path).to eq("/stations/1")
  end
end
