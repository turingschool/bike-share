require 'will_paginate'
require 'will_paginate/active_record'

class Weather < ActiveRecord::Base
  validates_presence_of :date
  has_many :trips

  def self.per_page
    30
  end
end
