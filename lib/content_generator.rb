class ContentGenerator 
  
  def self.generate_categories

    categories = {'ОДЕЖДА' => ['Блуза', 'Болеро', 'Брюки', 'Джинсы', 'Жакет',
                               'Жилет', 'Кардиган', 'Комбинезон', 'Куртка', 'Пальто',
                               'Платье', 'Плащ', 'Пончо', 'Пуловер', 'Рубашка', 'Топ',
                               'Футболка', 'Шорты', 'Юбка', 'ДЛЯ ПЛЯЖА', 'Купальник', 'ОБУВЬ',
                               'Босоножки', 'Ботильоны', 'Мокасины', 'Туфли', 'Балетки', 'Сапоги'],
                  'АКСЕССУАРЫ' => %w(Бандана Брошь Колье Пояс Сумка Шаль Шляпа Шапка Шарф),
                  'ОДЕЖДА' => %w(Блуза Болеро Брюки Джинсы Жакет Жилет Кардиган Комбинезон Куртка Платье Плащ Пальто Пончо Пуловер Рубашка Топ Футболка Шорты Юбка),
                  'ДЛЯ ПЛЯЖА' => ['Купальник'],
                  'ОБУВЬ' => ['Босоножки', 'Ботильоны', 'Мокасины', 'Туфли', 'Балетки', 'СапогиОсталось 3 вещи'],
                  'АКСЕССУАРЫ' => ['Бандана', 'Брошь', 'Колье', 'Пояс', 'Сумка', 'Шаль', 'ШляпаОсталось 4 вещи',
                                   'ШапкаОсталось 1 вещь', 'Шарф'] }
    categories.each_key do |key|
      parent = Category.create(name: key)
      categories[key].each do |sub_category|
        Category.create(name: sub_category, parent: parent)
      end
    end
  end

  def self.clone_good(count)
    seasons = %w(winter summer)
    good = Good.first
    count.times do |i|
      clone = good.dup
      clone.sizes = good.sizes
      clone.seson = seasons.sample
      clone.save
    end
  end

end