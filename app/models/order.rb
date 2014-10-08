class Order < ActiveRecord::Base

  # == REFERENCES
  belongs_to :user
  has_many :order_goods
  has_many :goods, through: :order_goods

  def price
    self.goods.sum(:price)
  end

  def full_name
    "#{name} #{family} #{second_name}"
  end

  def address
    "#{post_index} #{city} #{street}"
  end

  def self.count_of_new
    0
  end

end
