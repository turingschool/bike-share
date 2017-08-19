RSpec.describe "User can see a specific station" do
	it "When visiting station / station id" do
		Station.create(name: "Turing", city: "Hell", installation_date: "1969/4/20", dock_count: 69)
		Station.create(name: "Mushroom", city: "Englewood", installation_date: "1982/3/10", dock_count: 413)

		visit 'stations/1'

		expect(page).to have_content("Turing")
		expect(page).to have_content("Hell")

		# visit "stations/2"
		# #
		# # save_and_open_page
		# expect(page).to have_content("Mushroom")
		# expect(page).to have_content("Englewood")

	end
end
