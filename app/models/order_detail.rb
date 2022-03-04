class OrderDetail < ApplicationRecord
  enum production_status: {
    no_production: 0,
    production_waiting: 1,
    in_production: 2,
    completed: 3,
  }
end
