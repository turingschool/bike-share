
describe "User" do
  it "can see all conditions on a page" do

    condition_1 = Condition.create(date: , max_temperature: , min_temperature: ,
                     max_humidity: ,mean_visibility: , mean_windspeed: ,
                     precipitation:  )

    condition_2 = Condition.create(date: , max_temperature: , min_temperature: ,
                     max_humidity: ,mean_visibility: , mean_windspeed: ,
                     precipitation:  )
     visit '/conditions'

     expect(page).to have_content("#{condition_1.name}")

     expect(page).to have_content("#{condition_1.name}")

  end
end
