RSpec.describe "User clicks edit button" do
  it "on show page" do
    visit('/conditions/1')
    save_and_open_page

    click_link_or_button("edit")

    expect(current_path).to eq("/conditions/1/edit")
  end
end
