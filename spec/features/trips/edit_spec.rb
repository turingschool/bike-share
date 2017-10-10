# describe '/trips/1/edit' do
#   before :each do
#     trip = Trip.create(id: 1,
#                       duration: 20,
#                       start_date: "11-3-2014",
#                       start_time: "14:44",
#                       start_station_id: 1,
#                       end_date: "10-2-2015",
#                       end_time: "14:56",
#                       end_station_id: 2,
#                       bike_id: 12,
#                       subscription_type: "Subscriber",
#                       zip_code: 80210)
#
#     visit '/trips/1/edit'
#   end
#
# it "user sees edit functionality with trip duration" do
#   expect(page).to have_field("trip[duration]")
# end
#
# it "user sees edit functionality with trip start date" do
#   expect(page).to have_field("trip[start_date]")
# end
#
# it "user sees edit functionality with start station id" do
#   expect(page).to have_field("trip[start_station_id]")
# end
#
#
# end
