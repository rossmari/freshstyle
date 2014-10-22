class GoodsFilter

  JOINS = [:sizes]
  SORT_PARAMS = [:season, :brand_id, :size_id, :category_id ]

  attr_reader :season, :category, :brand_id, :size_id

  def initialize(params)
    @category = Category.find(params[:category_id])
    @params = params[:filter] || {}
    @params[:category_id] = @category.id.to_s
    process_params
  end

  def process_params
    clear_params_hash(@params)
    SORT_PARAMS.each do |key|
      instance_variable_set("@#{key}", @params.delete(key))
    end
  end

  def search
    goods = Good.joins(:sizes)
    SORT_PARAMS.each do |key|
      value =  instance_variable_get("@#{key}")
      if value
        goods = goods.where("#{key} = ?", value)
      end
    end
    check_goods_and_category(goods.uniq)
  end

  def clear_params_hash(hash)
    hash.delete_if do |k, v|
      if v.empty?
        true
      else
        if v.is_a? Hash
          clear_params_hash(v).empty?
        elsif v.is_a? Array
          clear_params_array(v).empty?
        end
      end
    end
  end

  def clear_params_array(array)
    array.delete_if{|value| value.empty?}
  end

  def check_goods_and_category(goods)
    if @category.root? && goods.empty?
      return root_category_goods
    else
      return goods
    end
  end

  def root_category_goods
    category = @category.children
    ids = Good.where(category: category).to_a.uniq(&:category_id).map(&:id)
    return Good.where(id: ids)
  end

end
