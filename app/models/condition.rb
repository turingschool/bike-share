require 'will_paginate'
require 'will_paginate/active_record'

class Condition < ActiveRecord::Base
acts_as_copy_target #for postgres copy
end
