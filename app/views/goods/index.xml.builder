xml.instruct! :xml, version: '1.0'
xml.declare! :DOCTYPE, :yml_catalog, :SYSTEM, "shops.dtd"
xml.yml_catalog date: Time.zone.now.strftime('%Y-%M-%d %H:%M') do
  xml.shop do
    xml.name 'FreshStyles'
    xml.company 'FreshStyles'
    xml.url 'http://freshstyles.ru/'
    xml.currencies do
      xml.currency id: 'RUR', rate: '1', plus: '0'
    end
    xml.categories do
      Category.roots.includes(:children).each do |root_cat|
        xml.category CGI::escapeHTML(root_cat.name), id: root_cat.id
        root_cat.children.each do |child_cat|
          xml.category CGI::escapeHTML(child_cat.name), id: child_cat.id, parentId: child_cat.parent_id
        end
      end
    end
    xml.local_delivery_cost 0
    xml.offers do
      @goods.find_each do |good|
        xml.offer id: good.id, type: 'vendor.model', available: !good.count_in_stock.zero? do
          xml.url good_url(good)
          xml.price good.price
          xml.currencyId 'RUR'
          xml.categoryId good.category_id
          xml.picture good.main_image(:big) ? "http://freshstyles.ru#{good.main_image(:big)}" : ''
          xml.delivery true
          xml.local_delivery_cost 250
          xml.vendor good.brand.try(:title)
          xml.vendorCode good.article
          xml.model good.title
          xml.description (good.description || '')
          xml.available !good.count_in_stock.zero?
          xml.country_of_origin good.origin_country.try(:name)
          xml.param good.color, name: 'Цвет'
          xml.param human_season(good.season), name: 'Сезон'
          xml.param good.design_country.try(:name), name: 'Страна дизайна'
        end
      end
    end
  end
end