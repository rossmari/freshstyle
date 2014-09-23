class Good < ActiveRecord::Base

  # == REFERENCES
  belongs_to :origin_country, class_name: 'Country'
  belongs_to :design_country, class_name: 'Country'
  belongs_to :brand


  # == VALIDATORS
  validates :title, :count_in_store, :price, presence: true
end
