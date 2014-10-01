class Size < ActiveRecord::Base

  # === VALIDATORS
  validates_presence_of :name

  # === REFERENCES
  has_many :goods_sizes
  has_many :goods, through: :goods_sizes

end
