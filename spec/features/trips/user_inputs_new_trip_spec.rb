require './spec/spec_helper'

feature 'when user visits the create new trip page' do
    background { visit '/trips/new' }

    it 'has status code 200' do 
        expect(page.status_code).to eq(200)
    end

    it 'they see a form' do
        expect(page).to have_selector('form')
    end

    it 'they see a duration field' do
        expect(page).to have_field('trip[duration]')
    end

    it 'they see a start date field' do
        expect(page).to have_field('trip[start_date]')
    end

    it 'they see a start station field' do
        expect(page).to have_field('trip[start_station]')
    end

    it 'they see a end date field' do
        expect(page).to have_field('trip[end_date]')
    end

    it 'they see a end station field' do
        expect(page).to have_field('trip[end_station]')
    end

    it 'they see a bike id field' do
        expect(page).to have_field('trip[bike_id]')
    end

    it 'they see a subscription type field' do
        expect(page).to have_field('trip[subscription_type]')
    end

    it 'they see a zip code field' do
        expect(page).to have_field('trip[zip_code]')
    end

    it 'they see a submit button' do
        expect(page).to have_selector('input[type=submit]')
    end
end

# # As an (administrative)user? from the dashboard,
# # they navigate to the sidebar
# # they click on the new trip button

    # # # they then see a form that accepts all informaiton required by our station database
    #     They see a form
    #         fields for:
    #             duration
    #             start date
    #             start station id
    #             end date
    #             end station
    #             bike id
    #             subscription type
    #             zipcode
    


# # they fill out each form accordingly
# # (should we have drop down forms for certain attributes?)
# # they press the create new station button
# # they then are routed to the show page for the new station





# # Navigating to dasboard

# # When a user goes to the home page 
# # And they navigate to the navbar(topbar)
# # and they click on the stations button
# # They then see the stations dashboard

# # to index

# # As a user from the dashboard, 
# # and they navigate to the sidebar
# # and they click on the index button
# # they then see a page with a list of all stations

# # to new station

# # to edit station

# # As a user from the dashboard,
# # they navigate to the sidebar
# # and they click on the index button
# # they are presented with a page of all stations
# # and they click on a station
# # and they are presented with a station show page
# # and they navigate to the bottom to the edit button
# # and they click on the edit button
# # and they are presented with a station edit form
# # and they edit any information accordingly
# # and they press the 'update' button at the bottom of the form
# # they then are presented with the newly update station show page

# # to delete a station

# # As a user form the dashboard
# # they navigate to the sidebar
# # and they click on the index button
# # they then are presented with a page of all stations
# # and they click on a station
# # and they are presented with a station show page
# # and they navigate to the bottom to the delete button
# # and they click on the delete button
# # they are presented with a delete confirmation page
# # they choose between the 'delete' or 'return to station' button
# # if they press the 'delete' button,
# #     they then return the the station index page
# # if they press the 'return to station' button
# #     they return to the station show page.
