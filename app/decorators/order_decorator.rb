class OrderDecorator < BaseDecorator
  delegate :id,
           :name, :family, :second_name,
           :goods, :order_goods,
           :phone, :email,
           :state,
           :post_index, :city, :street,
           :comment,
           :created_at, to: :object

  def initialize(order)
    @object = order
    super()
  end

  def full_name
    "#{name} #{second_name} #{family}".strip
  end

  def address
    "#{post_index} #{city} #{street}".strip
  end

  def price
    goods.sum(:price)
  end
end
