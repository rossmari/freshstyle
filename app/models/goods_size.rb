class GoodsSize < ActiveRecord::Base

  # == REFERENCES
  belongs_to :good
  belongs_to :size

end
