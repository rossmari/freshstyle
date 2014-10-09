class GoodsFilter

  JOINS = [:sizes]

  SORT_PARAMS = [:category_id, :season, :brand_id, :size_id ]

  attr_reader :season, :category_id, :brand_id, :size_id

  def initialize(params)
    @params = params
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
    return goods.uniq
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


end