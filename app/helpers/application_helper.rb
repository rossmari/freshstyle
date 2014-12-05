module ApplicationHelper
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
