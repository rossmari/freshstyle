class BackCall < ActiveRecord::Base

  # === VALIDATORS
  validates :phone, presence: true

  scope :new_calls, ->{where(processed: false)}

end
