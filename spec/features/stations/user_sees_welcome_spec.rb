describe "User visits '/'" do
  it "and sees a welcome message" do

    visit '/'

    expect(page).to have_content("Welcome!")
  end
end
