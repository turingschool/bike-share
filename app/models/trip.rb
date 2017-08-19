<<<<<<< HEAD
class Trip < ActiveRecord::Base
  
=======

class Trip < ActiveRecord::Base
  acts_as_copy_target #this is from the postgres-copy gem

>>>>>>> trip_import
end
