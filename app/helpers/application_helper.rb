module ApplicationHelper

  def goods_breadcrumbs(selected_category)
    # no matter how many levels category will have
    # we take parents tree
    parents_tree = selected_category.self_and_ancestors
    # and if category has children from next.level add one of them
    if selected_category.children.any?
      parents_tree << selected_category.children.first
    end

    levels = ''
    # and then siblings from every level
    parents_tree.each do |parent|
      level_content = ''
      # collect categories from each level into string as <li>link</li>
      parent.self_and_siblings.order(:name).each do |category|
        if category == parent &&  category.depth <= selected_category.depth
          level_content << content_tag(:li, category.name, class: 'active')
        else
          level_content << content_tag(:li, link_to(category.name, category_goods_path(category)))
        end

      end
      # wrap links into <ol> and push to levels
      levels << content_tag(:ol, raw(level_content) , class: 'breadcrumb')
    end
    raw(levels)
  end

  def number_to_rubls(number)
    number_to_currency(number, unit: 'руб.', separator: ',', delimiter: '.')
  end

  def error_text(attribute, model)
    if model.errors.messages.keys.include?(attribute)
      unless model.errors[attribute].empty?
        content_tag(:em, "#{model.class.human_attribute_name(attribute)} #{model.errors[attribute].join(', ')} !", class: 'text-danger')
      end
    end
  end

  def human_season(key)
    { 'winter' => 'Осень - Зима', 'summer' => 'Весна - Лето' }[key]
  end
end
