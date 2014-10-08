class ClientMessage < ActiveRecord::Base

  # === VALIDATORS
  validates_presence_of :name, :email, :content

end
