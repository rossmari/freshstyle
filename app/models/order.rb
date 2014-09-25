class Order < ActiveRecord::Base

  # == REFERENCES
  belongs_to :user
  has_many :order_goods
  has_many :goods, through: :order_goods

  # === VALIDATORS
  validates_presence_of :user

  def price
    self.goods.sum(:price)
  end

end
