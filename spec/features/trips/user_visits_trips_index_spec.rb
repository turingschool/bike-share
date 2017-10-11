# require './spec/spec_helper'
#
# feature 'when user visits the trips index page' do
#   background { visit '/trips' }
#
#   it 'they experience status code 200' do
#     expect(page.status_code).to eq(200)
#   end
#
#   it 'they see the duration' do
#     expect(page).to have_content(/duration/i)
#     expect(page).to have_content('10')
#   end
#
#   it 'they see the start date' do
#     expect(page).to have_content(/start date/i)
#     expect(page).to have_content('2001-01-02')
#   end
#
#   it 'they see the start station' do
#     skip
#     expect(page).to have_content(/start station/i)
#     expect(page).to have_content('42')
#   end
#
#   it 'they see the end date' do
#     expect(page).to have_content(/end date/i)
#     expect(page).to have_content('2001-01-01')
#   end
#
#   it 'they see the end station' do
#     skip
#     expect(page).to have_content(/end station/i)
#     expect(page).to have_content('43')
#   end
#
#   it 'they see the bike id' do
#     expect(page).to have_content(/bike id/i)
#     expect(page).to have_content('1001')
#   end
#
#   it 'they see the subscription' do
#     expect(page).to have_content(/subscription/i)
#     expect(page).to have_content('Subscriber')
#   end
#
#   it 'they see the zip code' do
#     expect(page).to have_content(/zip code/i)
#     expect(page).to have_content('80303')
#   end
#
# end
