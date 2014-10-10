module ApplicationHelper

  def goods_breadcrumbs(category)

    # no matter how many levels category will have
    # we take parents tree
    parents_tree = category.self_and_ancestors
    # and if category has children from next.level add one of them
    if category.children.any?
      parents_tree << category.children.first
    end

    levels = ''
    # and then siblings from every level
    parents_tree.each do |parent|
      level_content = ''
      # collect categories from each level into string as <li>link</li>
      parent.self_and_siblings.order(:name).each do |category|
        level_content << content_tag(:li, link_to(category.name, category_goods_path(category)))
      end
      # wrap links into <ol> and push to levels
      levels << content_tag(:ol, raw(level_content) , class: 'breadcrumb')
    end
    return raw(levels)
  end

end
