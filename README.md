# Bike Share

## Abstract

In this project you'll use Ruby, Sinatra, and Activerecord to build a site that analyzes bike share usage in San Francisco.

This application will collect data in two ways: 1) through web forms allowing users to enter trip/station/weather information, and 2) by consuming CSV files with historical information for stations, trips, and weather. In addition to creating and storing this information for viewing at a later date, this application will provide a number of user dashboards with higher level analysis of trends in bike share usage.

At a high level, this project will develop along the following path:

* **Iteration 1**: Allow users to save and view information related to bike share stations.
* **Iteration 2**: Create a seed file to consume information on the seventy existing bike share stations in San Francisco.
* **Iteration 3**: Create a station dashboard with analysis of station information (split by city, date installed, number of of bicycle docks)
* **Iteration 4**: Allow users to save and view information related to trips taken.
* **Iteration 5**: Update the seed file to consume information on the nearly 670,000 trips taken between August 29, 2013, and August 31, 2015.
* **Iteration 6**: Add information to the station dashboard using trip information, and create a trip dashboard with an analysis of trips taken.
* **Iteration 7**: Allow users to enter weather information.
* **Iteration 8**: Update the seed file to consume weather information.
* **Iteration 9**: Create a weather dashboard and update the trip dashboard with additional analytics regarding the relationship between weather and trips taken.

## Learning Goals

### ActiveRecord

* Use ActiveRecord migrations to create a normalized database
* Use intermediate ActiveRecord queries to calculate and report on information in the database
* Utilize ActiveRecord methods and relationships to efficiently query the database

### User Experience and Conventions

* Use Sinatra and ERB templates to render views to create, read, update, and delete resources using RESTful routes and appropriate HTTP verbs
* Use Sinatra and ERB templates to display a dashboard not related to a specific resource saved in the database
* Use HTML and CSS to create a user experience that allows users to comfortably navigate a site

### Code Organization/Quality

* Organize code using best practices (use POROs when appropriate, avoid long methods, etc.)
* Create methods using ActiveRecord on the appropriate class.

### Testing

* Use RSpec to drive development at the feature and model levels.

### Working Collaboratively

* Use Git and GitHub to work collaboratively, develop in smaller groups, and resolve merge conflicts

## Getting Started

### Define the Relationship with Your Group

DTR with your group [here](https://gist.github.com/case-eee/38e212c799c563f58766128b5057858a). One group member should send a link of the forked gist to your anchor as soon as it's complete.

### Clone the Project

1. One team member forks this skeleton repository.
1. Add the other team members as collaborators.
1. Add instructors as collaborators.

### Requirements

This project must use:

* [Sinatra](http://www.sinatrarb.com/)
* [PostgreSQL](http://www.postgresql.org/)
* [ActiveRecord](http://guides.rubyonrails.org/active_record_basics.html)

This base repo has already configured those three for you.

You'll want to set up the [DatabaseCleaner](https://github.com/DatabaseCleaner/database_cleaner) gem in order to have a clean database each time you run tests. Follow the instructions for setting up the gem. Due to a bug in the most recent version of the gem, you'll need to use this line when you set the strategy in your test helper file:

```ruby
DatabaseCleaner.strategy = :truncation
```

See the "Resources" section at the bottom of this page for additional helpful documentation.

### Restrictions

The project may not use:

* `Rails`

## Instructions

Iterations 0-9 must be completed in order to consider the project complete.
Please TDD throughout. Tests are expected for all features and all models.

## Base Expectations

### Iteration 1

Create full CRUD functionality for a station with the following characteristics:

* name
* dock count
* city
* installation date

Once you have the `Station` model started, finish it off by creating validations for the `Station` attributes.

* All the attributes must be present.

You can use ActiveRecord's [validations feature](http://guides.rubyonrails.org/active_record_validations.html) to make sure no record is saved without having all attributes present.

**Be sure to have a test for each individual validation.**

At the end of this iteration, you should be able to view an index of all stations, view a page for a single station, create a station, edit a station, and delete a station from either the index or the show pages.

### Iteration 2

Download the dataset available [here](https://www.kaggle.com/benhamner/sf-bay-area-bike-share). This will include all of the CSV files that you will be using in this project. Since these files are large, we have set up your project directory structure and `.gitignore` so that when you add these files to the `/db/csv/` directory they will not be pushed up to GitHub. However, this also means that each of the members of your team will need to download these files independently. Please note that there are idiosyncracies in the data that are outlined in some detail [here](https://www.kaggle.com/benhamner/sf-bay-area-bike-share/discussion/23165). These may not be important to you at this moment, but this will be an important reference as you move through future iterations.

Update the seeds file in your `/db` directory and add the `station.csv` file to your `/db/csv/` directory. When you run `rake db:seed` your development database should be populated with the information from the `station.csv` file. Your index should include a total of seventy stations.

### Iteration 3

Create a station dashboard route. When you visit `/station-dashboard` you should be shown a page with the following information:

* Total count of stations
* Average bikes available per station (based on docks).
* Most bikes available at a station (based on docks).
* Station(s) where the most bikes are available (based on docks).
* Fewest bikes available at a station (based on docks).
* Station(s) where the fewest bikes are available (based on docks).
* Most recently installed station.
* Oldest station.

### Iteration 4

Create full CRUD functionality for a trip with the following characteristics:

* Duration
* Start Date
* Start Station
* End Date
* End Station
* Bike ID
* Subscription Type
* Zip Code

Note: Zip Code is a user-provided field, and may not be present on all records. Otherwise, as with `Station`'s, all attributes of a `Trip` need to be present to ensure data integrity. Don't forget your validations and tests for each validation.

As with Iteration 1, be sure that you are working to normalize your database. This may mean using references to existing tables. At the end of this iteration users should be able to visit the following routes:

* `/trips`
* `/trips/:id`
* `/trips/new`
* `/trips/:id/edit`

When a user visits the `/trips` path, they should only see the first thirty trips taken organized by date. On that page, there should also be a button to see the next thirty trips. Once a user visits a second page, there should be buttons to move both forward and backward in time.

Additionally, users should be able to delete a trip from the views rendered at both `/trips/:id` and `/trips`.


### Iteration 5

Add the `trip.csv` file to your `db/csv` directory, and update your `seed.rb` file so that it also imports the information in `trip.csv`. Be sure to adjust your seed file so that when it is run it does not create duplicate data.

### Iteration 6

Create a trips dashbord route. When you visit `/trips-dashboard` users should be shown a page with the following information:

* Average duration of a ride.
* Longest ride.
* Shortest ride.
* Station with the most rides as a starting place.
* Station with the most rides as an ending place.
* Month by Month breakdown of number of rides with subtotals for each year.
* Most ridden bike with total number of rides for that bike.
* Least ridden bike with total number of rides for that bike.
* User subscription type breakout with both count and percentage.
* Single date with the highest number of trips with a count of those trips.
* Single date with the lowest number of trips with a count of those trips.

On an individual station show page add the following information:

* Number of rides started at this station.
* Number of rides ended at this station.
* Most frequent destination station (for rides that began at this station).
* Most freuqnet origination station (for rides that ended at this station).
* Date with the highest number of trips started at this station.
* Most frequent zip code for users starting trips at this station.
* Bike ID most frequently starting a trip at this station.

### Iteration 7

Create full CRUD functionality for a day's weather conditions with the following characteristics:

* Date
* Max Temperature
* Mean Temperature
* Min Temperature
* Mean Humidity
* Mean Visibility (in Miles)
* Mean Wind Speed (mph)
* Precipitation (inches)

At the end of this iteration users should be able to visit the following routes:

* `/conditions`
* `/conditions/:id`
* `/conditions/new`
* `/conditions/:id/edit`

As with `/trips`, users should only be shown the weather conditions for thirty days when they visit `/conditions` and should be able to navigate to other pages with forward/backward buttons.

Additionally, users should be able to delete a the weather conditions for a particular date from the views rendered at both `/conditions/:id` and `/conditions`.

### Iteration 8

Add the `weather.csv` file to your `db/csv` directory, and update your `seed.rb` file so that it also imports the information in `weather.csv`. Be sure to adjust your seed file so that when it is run it does not create duplicate data.

**Note:** The data in the `weather.csv` file includes information for multiple zip codes. For the purpose of this project, we would like to assume that the weather in San Francisco is uniform across all Station locations. **Only import the weather data from a single zip code.** Ignore the remaining data.

### Iteration 9

Create a weather dashboard available at `/weather-dashboard` that includes the following information:

* Breakout of average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks (e.g. average number of rides on days with high temps between fifty and sixty degrees)
* Breakout of average number of rides, highest number of rides, and lowest number of rides on days with precipitation in half-inch increments.
* Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean wind speeds in four mile increments.
* Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean visibility in miles in four mile increments.

Add the following information to your trip dashboard:

* Weather on the day with the highest rides.
* Weather on the day with the lowest rides.

## Extensions

* Read about [JSON](http://www.ruby-doc.org/stdlib-2.0/libdoc/json/rdoc/JSON.html). Create an endpoint at `api/v1/stations/:id` that responds to requests with JSON instead of HTML.
* Use [Google Charts](https://developers.google.com/chart/) to display information on one or more of your dashboards.
* Add latitude and longitude to your station table. Create a Google map with pins for each of the stations.

## Evaluation Rubric

The project will be assessed with the following rubric:

### Base Functionality

[] CRUD Functionality
    [] Full CRUD for a Station
    [] Full CRUD for a Trip
    [] Full CRUD for a Condition
[] Seeding
    [] Stations seeded
    [] Trips seeded
    [] Conditions seeded
[] UI/UX
    [] Able to navigate to all pages without typing into the nav bar
    [] Not relying on default styling
    [] Styled such that the project could potentially be presented as a prototype
[] Analytics
    [] Station Dashboard
        [] Total Count of Stations
        [] Average Bikes Available
        [] Most Bikes Available
        [] Station(s) where most bikes available
        [] Fewest Bikes Available
        [] Station(s) where fewest bikes availalbe
        [] Most recently installed station
        [] Oldest station
    [] Trips Dashboard
        [] Average duration
        [] Longest ride
        [] Shortest ride
        [] Station with most rides as a starting place
        [] Station with most rides as an ending place
        [] Month-by-month breakdown of number of rides
        [] Subtotals for each year
        [] Most ridden bike with total number of rides for that bike
        [] Least ridden bike with total number of rides for that bike
        [] User subscription type breakout with both count and percentage
        [] Single date with the highest number of trips with a count of those trips
        [] Single date with the lowest number of trips with a count of those trips
        [] Weather on the day with the highest rides
        [] Weather on the day with the lowest rides
    [] Weather Dashboard
        [] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks (e.g. average number of rides on days with high temps between fifty and sixty degrees)
        [] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with precipitation in half-inch increments.
        [] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean wind speeds in four mile increments.
        [] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean visibility in miles in four mile increments.
    [] Station Show
        [] Number of rides started at this station.
        [] Number of rides ended at this station.
        [] Most frequent destination station (for rides that began at this station).
        [] Most freuqnet origination station (for rides that ended at this station).
        [] Date with the highest number of trips started at this station.
        [] Most frequent zip code for users starting trips at this station.
        [] Bike ID most frequently starting a trip at this station.
[] Testing
    [] Stations
        [] Attribute validations
        [] Model methods
    [] Trips
        [] Attribute validations
        [] Model methods
    [] Conditions
        [] Attribute validations
        [] Model methods
    [] Feature Tests
        [] CRUD functionality
        [] Dashboard functionality
[] Models
    [] Primarily use ActiveRecord in models
    [] Validate attributes
    [] Create associations between models
[] Views
    [] No logic in the view used to calculate values
    [] No logic in the view used to format data
    [] Organized in a way that is generally easy to understand
    [] Use instance variables provided by Controller/no messages sent directly to models
[] Controller(s)
    [] Routes organized in a way that is easy to follow
    [] Logic is limited to collecting information from a model/rendering a view (more complex interactions with the database have been pushed to the Model)
[] GitHub/Waffle
    [] Pull requests include discussion of code under review
    [] Pull requests are small in scope and centered around a particular feature (not an iteration or person)
    [] Students use Waffle/Issues to assign tasks to collaborators
    [] Students use Waffle/Issues to track features

### Stretch Goals

[] Nearly all ActiveRecord in model methods (not using other Ruby methods to map/min/max, etc.)
[] API endpoints
[] Google charts
[] Google maps
[] Client-ready styling


