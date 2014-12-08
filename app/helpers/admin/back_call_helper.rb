module Admin::BackCallHelper
  def answered_label(model)
    content = ''
    state = model.processed ? 'processed' : 'new'
    label = model.processed ? 'success'   : 'default'

    icon = content_tag(:span, t("#{model.class.to_s.underscore}.process_state.#{state}"), class: "label label-#{label}")

    content << content_tag(:h4, icon, style: 'display:inline;')
    raw(content)
  end
end
