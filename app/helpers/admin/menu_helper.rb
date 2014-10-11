module Admin::MenuHelper

  # for bootstrap
  def admin_menu
    # menu items list, add here some menu new items
    items = [
      link_to("#{t('order.orders')} (#{Order.count_of_new})", admin_orders_path),
      link_to(t('good.goods'), admin_goods_path),
      link_to(t('page.pages'), admin_pages_path),
      link_to(t('category.categories'), admin_categories_path),
      link_to(t('brand.brands'), admin_brands_path),
      link_to(t('country.countries'), admin_countries_path),
      link_to(t('size.sizes'), admin_sizes_path),
      link_to(t('carousel.carousels'), admin_carousels_path),
      # link_to(t('main_offer.main_offers'), admin_main_offers_path)
      # link_to(t('user.users'), admin_users_path)
    ]
    raw(generate_menu(items))
  end

  def generate_menu(items)
    menu = ''
    items.each do |item|
      menu += content_tag(:li, item, class: ('active' if is_active_item?(item)))
    end
    return menu
  end

  def is_active_item?(item)
    Regexp.new(controller_name).match(item.to_param)
  end

  def human_name(attribute_name)
    model = controller_name.classify.constantize
    model.send('human_attribute_name', attribute_name)
  end

end
