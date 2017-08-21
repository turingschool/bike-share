

describe "user" do
  it "can see an individual condition" do

     condition_1 = Condition.create(date:'10/16/10' ,
                                   max_temperature: 77,
                                   min_temperature: 65,
                                   mean_humidity: 43,
                                   mean_visibility: 22,
                                   mean_windspeed: 30,
                                   precipitation:  1)


 visit "/station/#{Condition.last.id}"

 expect(page).to have_content("#{condition_1.date}")

  end
end
