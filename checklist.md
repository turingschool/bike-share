### General
* [X] Navigation to all links
* [X] Simple styling present

### Iteration 1

* [X] See all stations
* [X] See one station
* [X] Create a new station
* [X] Update a station
* [X] Delete a station (from either index or show)
* [X] Cannot save without name, dock count, city, installation date

### Iteration 2

* [X] 70 Stations Load from CSV

### Iteration 3

On `/station-dashboard`:

* [X] Total count of stations
* [X] Average bikes available per station (based on docks).
* [X] Most bikes available at a station (based on docks).
* [X] Station(s) where the most bikes are available (based on docks).
* [X] Fewest bikes available at a station (based on docks).
* [X] Station(s) where the fewest bikes are available (based on docks).
* [X] Most recently installed station.
* [X] Oldest station.

### Iteration 4

* [X] See all trips
* [X] See one trip
* [X] Create a new trip
* [X] Update a trip
* [X] Delete a trip (from either index or show)
* [X] All attributes (except zip code) must be present: duration, start date, start station, end date, end station, bike ID, subscription type)
* [X] Trips are paginated in groups of 30

### Iteration 5

* [X] Trips load from CSV

### Iteration 6

On `/trips-dashboard`: <<<<<NEED FIX

* [X] Average duration of a ride.
* [X] Longest ride.
* [X] Shortest ride.
* [X] Station with the most rides as a starting place.
* [X] Station with the most rides as an ending place.
* [X] Month by Month breakdown of number of rides with subtotals for each year.
* [X] Most ridden bike with total number of rides for that bike.
* [X] Least ridden bike with total number of rides for that bike.
* [X] User subscription type breakout with both count and percentage.
* [X] Single date with the highest number of trips with a count of those trips.
* [X] Single date with the lowest number of trips with a count of those trips.

On an individual station show page the additional information should be present:

* [X] Number of rides started at this station.
* [X] Number of rides ended at this station.
* [X] Most frequent destination station (for rides that began at this station).
* [X] Most frequent origination station (for rides that ended at this station).
* [X] Date with the highest number of trips started at this station.
* [X] Most frequent zip code for users starting trips at this station.
* [X] Bike ID most frequently starting a trip at this station.

### Iteration 7

* [X] See all conditions
* [X] See one condition
* [X] Create a new condition
* [X] Update a condition
* [ ] Delete a station (from both index or show)
* [X] Attributes include: duration, start date, start station, end date, end station, bike ID, subscription type
* [X] Conditions are paginated by groups of 30

### Iteration 8

* [X] Weathers load from CSV

### Iteration 9

On `/weather-dashboard`:

* [X] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks (e.g. average number of rides on days with high temps between fifty and sixty degrees)
* [X] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with precipitation in half-inch increments.
* [X] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean wind speeds in four mile increments.
* [X] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean visibility in miles in four mile increments.

Additional information on the `trip-dashboard`:

* [ ] Weather on the day with the highest rides.
* [ ] Weather on the day with the lowest rides.
