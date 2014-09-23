#encoding: utf-8
module ButtonHelper

  def add_button(route)
    link_to route, class: 'btn btn-primary btn-sm btn-block' do
       content_tag(:span, '', class: 'glyphicon glyphicon-plus') +
       ' Добавить'
    end
  end

  def show_button(route)
    template_button(route, t('actions.show'), 'btn btn-danger btn-sm btn-block', 'glyphicon glyphicon-question-sign')
  end

  def edit_button(route)
    template_button(route, t('actions.edit'), 'btn btn-info btn-sm btn-block', 'glyphicon glyphicon-pencil')
  end

  def delete_button(route)
    link_to route, class: 'btn btn-danger btn-sm btn-block', method: :delete, data: { confirm: 'Are you sure?' } do
      content_tag(:span, '', class: 'glyphicon glyphicon-trash') +
      ' ' + t('actions.delete')
    end
  end

  def back(route)
    template_button(route, t('actions.back'), 'btn btn-primary btn-sm btn-block', 'glyphicon glyphicon-arrow-left')
  end

  def template_button(route, title, button_class, icon_class)
    link_to route, class: button_class do
      content_tag(:span, '', class: icon_class) +
          " #{title}"
    end
  end

end
