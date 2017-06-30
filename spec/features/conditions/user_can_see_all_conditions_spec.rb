require_relative "../../spec_helper"

RSpec.describe "when a user visits '/conditions' " do

# show only 30 records per page limit(30) offset by 30 each page
# module pagination

  xit "they see welcome message" do
    visit "/conditions"

    expect(page).to eq("/conditions/page/1")
    expect(page).to have_content("All Trips")
  end

  xit "they can see 30 conditions" do
    visit "/conditions"

    expect(current_path).to eq("/conditions/page/1")


    expect(page).to have_content("All Conditions")

  end

  xit "and sees 30 conditions on each page" do

    condition = Condition.create(name: thing)




    visit('/conditions/page/1')

    expect(page).to have_content("x")
    expect(page).to have_content("x")
    expect(page).to_not have_content("x")
    expect(page).to_not have_content("x")

    click ("Next")

    expect(page).to have_content("x")
    expect(page).to have_content("x")
    expect(page).to_not have_content("x")
    expect(page).to_not have_content("x")
    expect(current_path).to eq('/conditions/page/2')

    click ("Previous")

    expect(page).to have_content("x")
    expect(page).to have_content("x")
    expect(page).to_not have_content("x")
    expect(page).to_not have_content("x")
    expect(current_path).to eq('/conditions/page/1')

  end
end
