require 'will_paginate'
require 'will_paginate/active_record'

class Condition < ActiveRecord::Base
  validates :date, uniqueness: { scope: :zip_code }
  validates_presence_of :date

  self.per_page = 30
end
