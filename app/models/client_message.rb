class ClientMessage < ActiveRecord::Base

  # === VALIDATORS
  validates_presence_of :name, :email, :content

  scope :new_messages, ->{where(processed: false)}

end
