module ButtonHelper
  def add_button(route)
    link_to route, class: 'btn btn-primary btn-sm btn-block' do
       content_tag(:span, '', class: 'glyphicon glyphicon-plus') +
       ' Добавить'
    end
  end

  def show_button(route)
    template_button(route, t('actions.show'), 'glyphicon glyphicon-eye-open')
  end

  def edit_button(route)
    template_button(route, t('actions.edit'), 'glyphicon glyphicon-pencil')
  end

  def delete_button(route)
    link_to route, method: :delete, data: { confirm: 'Are you sure?', toggle: 'tooltip', placement: 'bottom' }, title: t('actions.delete') do
      content_tag(:span, nil, class: 'glyphicon glyphicon-trash')
    end
  end

  def back(route)
    template_button(route, t('actions.back'), 'glyphicon glyphicon-arrow-left')
  end

  def template_button(route, title, icon_class)
    link_to route, data: { toggle: 'tooltip', placement: 'bottom' }, title: title do
      content_tag(:span, nil, class: icon_class)
    end
  end
end
