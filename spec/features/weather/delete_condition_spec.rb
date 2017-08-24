
describe "User" do
  it "can see all conditions on a page" do

    condition_1 = Condition.create(date:'2010-10-10',
                                   max_temperature: 70,
                                   min_temperature: 60,
                                   mean_humidity: 40,
                                   mean_visibility: 20,
                                   mean_windspeed: 50,
                                   precipitation:  3)

    condition_2 = Condition.create(date:'2010-09-10',
                                   max_temperature: 77,
                                   min_temperature: 65,
                                   mean_humidity: 43,
                                   mean_visibility: 22,
                                   mean_windspeed: 30,
                                   precipitation:  1)

     visit '/conditions'

     expect(page).to have_content("2010-10-10")
     expect(page).to have_content("#{condition_1.max_temperature}")
     expect(page).to have_content("#{condition_1.precipitation}")

     expect(page).to have_content("2010-09-10")
     expect(page).to have_content("#{condition_2.mean_humidity}")
     expect(page).to have_content("#{condition_2.mean_windspeed}")

  end
end
