require './rspec/spec_helper'

feature 'When a user visits trip index page' do
    background do 
        visit '/trips'
    end

    it 'they see the title' do
        expect(page).to have_content("Trips")
    end

    context 'when there are trips'
        background do
            Trip.create! duration: 63
                         start_date: 8/29/2013 14:13
                         start_station: South Van Ness at Market
                         end_date: South Van Ness at Market
                         end_station: 66
                         subscription_type: Subscriber
                         zip_code: 94127

            Trip.create! duration:
                         start_date: 
                         start_station:
                         end_date: 10
                         end_station: 661
                         subscription_type: Subscriber
                         zip_code: 95138

                        #  duration: 63
                        #  start_date: 8/29/2013 14:13
                        #  start_station_name: South Van Ness at Market
                        #  start_station_id: 66
                        #  end_date: 8/29/2013 14:14
                        #  end_station_name: South Van Ness at Market
                        #  end_station_id: 66
                        #  bike_id: 520
                        #  subscription_type: Subscriber
                        #  zip_code: 94127
        end
    end
end


# Navigating to dasboard

# When a user goes to the home page 
# And they navigate to the navbar(topbar)
# and they click on the stations button
# They then see the stations dashboard

# to index

# As a user from the dashboard, 
# and they navigate to the sidebar
# and they click on the index button
# they then see a page with a list of all stations

# to new station

# As an (administrative)user? from the dashboard,
# they navigate to the sidebar
# they click on the new station button
# they then see a form that accepts all informaiton required by our station database
# they fill out each form accordingly
# (should we have drop down forms for certain attributes?)
# they press the create new station button
# they then are routed to the show page for the new station

# to edit station

# As a user from the dashboard,
# they navigate to the sidebar
# and they click on the index button
# they are presented with a page of all stations
# and they click on a station
# and they are presented with a station show page
# and they navigate to the bottom to the edit button
# and they click on the edit button
# and they are presented with a station edit form
# and they edit any information accordingly
# and they press the 'update' button at the bottom of the form
# they then are presented with the newly update station show page

# to delete a station

# As a user form the dashboard
# they navigate to the sidebar
# and they click on the index button
# they then are presented with a page of all stations
# and they click on a station
# and they are presented with a station show page
# and they navigate to the bottom to the delete button
# and they click on the delete button
# they are presented with a delete confirmation page
# they choose between the 'delete' or 'return to station' button
# if they press the 'delete' button,
#     they then return the the station index page
# if they press the 'return to station' button
#     they return to the station show page.
