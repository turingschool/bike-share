RSpec.describe do "User clicks go back" do
  it "on show page" do
    visit('/conditions/1')

    click_link_or_button("go back")

    expect(current_path.to eq("/conditions")
  end
end
