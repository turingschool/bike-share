describe "User can delete station" do
  it "and click on button" do

    Station.create!(name: "Galvanize", dock_count: 10, city: "Denver", installation_date: "11/08/17")

    Station.create!(name: "Turing", dock_count: 10, city: "Denver", installation_date: "11/08/17")

    visit '/stations/1'
    click_on("delete")

    expect(current_path).to eq('/stations')
  end
end
