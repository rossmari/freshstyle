class BasketProcessor

  attr_reader :goods_wrappers, :total_price

  def initialize(basket)
    @parsed_data = basket.blank? ? [] : JSON.parse(basket)
    init_goods
    check_goods
    calculate_total_price
  end

  def init_goods
    @goods_wrappers = []
    @parsed_data.each do |good_info|
      @goods_wrappers << BasketGoodWrapper.new(good_info['id'], good_info['size'])
    end
  end

  def check_goods
    @goods_wrappers.each do |wrapper|
      wrapper.check_existence_and_init
    end
  end

  def goods_count
    @goods_wrappers.select{|w| w.exist}.count
  end

  def any_goods?
    goods_count > 0
  end

  def calculate_total_price
    @total_price = @goods_wrappers.select { |w| w.exist }.sum { |w| w.good.cost }
  end

end

class BasketGoodWrapper

  attr_accessor :id, :size, :exist, :good

  def initialize(id, size)
    @id = id
    @size = size
    @exist = false
  end

  def check_existence_and_init
    row = Good.where(id: @id).first
    @exist = !row.blank?
    @good = row.blank? ? nil : row
  end

end