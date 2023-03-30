class OrderDatail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum making_status: {not_manufacture: 0, wait_manufacture: 1, manufacture: 2, completion: 3}
end
