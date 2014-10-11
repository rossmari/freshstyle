class Page < ActiveRecord::Base
  include RankedModel
  ranks :row_order

  # == VALIDATORS
  validates :title, presence: true
end
