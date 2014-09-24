class Good < ActiveRecord::Base

  # == REFERENCES
  belongs_to :origin_country, class_name: 'Country'
  belongs_to :design_country, class_name: 'Country'
  belongs_to :brand
  has_many :goods_sizes
  has_many :sizes, through: :goods_sizes


  # == VALIDATORS
  validates :title, :count_in_stock, :price, presence: true

end
