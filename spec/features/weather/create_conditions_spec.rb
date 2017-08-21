describe "user" do
  it "can create a condition" do
    visit '/conditions/new'

    fill_in("condition[date]", with: "10/10/11")
    fill_in("condition[max_temperature]", with: "50")
    fill_in("condition[mean_temperature]", with: "11")
    fill_in("condition[min_temperature]", with: "10")
    fill_in("condition[mean_humidity]", with: "10")
    fill_in("condition[mean_visibility]", with: "10")
    fill_in("condition[mean_windspeed]", with: "10")
    fill_in("condition[precipitation]", with: "10")

    click_on("Create New Condition")

    expect(page).to have_content("2010-10-11")
  end
end
