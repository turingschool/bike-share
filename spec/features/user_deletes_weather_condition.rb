RSpec.describe do "User clicks delete button"
  it "deletes individual weather condition" do
    visit('/conditions/1')

    click_link_or_button("delete")

    expect(current_path).to eq("/conditions")
  end
end
