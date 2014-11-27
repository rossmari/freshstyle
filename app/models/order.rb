class Order < ActiveRecord::Base

  # == REFERENCES
  belongs_to :user
  has_many :order_goods
  has_many :goods, through: :order_goods

  # === VALIDATORS
  validates_presence_of :name, :phone, :email

  def self.count_of_new
    Order.where(state: 'new').count
  end
end

