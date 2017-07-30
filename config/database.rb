# set the database based on the current environment
database_name = "bike-share-#{BikeShareApp.environment}"


# connect ActiveRecord with the current database
db = URI.parse(ENV['DATABASE_URL'] || "postgres://localhost/#{database_name}")
ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :port     => db.port,
  :username => db.user,
  :password => db.password,
  :database => db.path[1..-1],
  :encoding => 'utf8'
)
