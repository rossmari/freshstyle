class Page < ActiveRecord::Base

  # == VALIDATORS
  validates :title, presence: true
end
