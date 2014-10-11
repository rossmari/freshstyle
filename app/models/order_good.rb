class OrderGood < ActiveRecord::Base

  # === REFERENCES
  belongs_to :good
  belongs_to :size
  belongs_to :order

end
