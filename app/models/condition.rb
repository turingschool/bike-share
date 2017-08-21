class Condition < ActiveRecord::Base
acts_as_copy_target #for postgres copy
end
