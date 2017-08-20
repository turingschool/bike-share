require 'will_paginate'
require 'will_paginate/active_record'

class Trip < ActiveRecord::Base
  helpers WillPaginate::Sinatra::Helpers

  helpers do
    def paginate(collection)
       options = {
         #renderer: BootstrapPagination::Sinatra,
         inner_window: 0,
         outer_window: 0,
         previous_label: '&laquo;',
         next_label: '&raquo;'
       }
      will_paginate collection, options
    end
  end
end
