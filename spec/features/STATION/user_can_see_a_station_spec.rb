RSpec.describe "User can see a specific station" do
	it "When visiting station / station id" do
		Station.create(name: "Turing", city: "Hell", installation_date: "1969/4/20", dock_count: 69)

		visit 'stations/1'

		page.has_content?("Turing")
		page.has_content?("Hell")
	end
end
