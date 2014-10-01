class Brand < ActiveRecord::Base

  # == REFERENCES
  has_many :goods, dependent: :nullify

  belongs_to :country


  # == VALIDATORS
  validates :title, presence: true
end
