
describe "User can access edit condition page" do
  it "and view form to edit condition" do


    condition_1 = Condition.create(date:'10/10/10' ,
                                   max_temperature: 70,
                                   min_temperature: 60,
                                   mean_humidity: 40,
                                   mean_visibility: 20,
                                   mean_windspeed: 50,
                                   precipitation:  3)
    visit '/conditions/1/edit'

    expect(page).to have_content("Edit Condition from #{condition_1.date}:")
  end
  it "and edit condition" do

    condition_1 = Condition.create(date:'10/10/10' ,
                                   max_temperature: 70,
                                   min_temperature: 60,
                                   mean_humidity: 40,
                                   mean_visibility: 20,
                                   mean_windspeed: 50,
                                   precipitation:  3)
    visit '/conditions/1/edit'

    fill_in("condition[date]", with: "2010/10/11")
    fill_in("condition[max_temperature]", with: "50")
    fill_in("condition[mean_temperature]", with: "11")
    fill_in("condition[min_temperature]", with: "10")

    fill_in("condition[mean_humidity]", with: "10")
    fill_in("condition[mean_visibility]", with: "10")
    fill_in("condition[mean_windspeed]", with: "10")
    fill_in("condition[precipitation]", with: "10")
    click_on("Update Condition")

    expect(page).to have_content("2010-10-11")
    expect(current_path).to eq("/conditions/#{Condition.last.id}")
  end
end
