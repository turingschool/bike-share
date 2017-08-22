RSpec.describe "User can interact with homepage" do
  describe "visiting the page" do
    it "shows the navbar" do
      visit("/")

      expect(page).to have_css(".nav")

      within(:css, ".nav") do
        expect(page).to have_content("Station Index")
        expect(page).to have_content("Trip Index")
      end
    end

    # it "lets you access station index" do
    #   visit("/")
    #   within(:css, ".container#button") do
    #     click_button("Station Index")
    #
    #     expect(page).to have_content("Station Index")
    #   end
    # end
  end
end
