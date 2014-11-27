module Admin::OrdersHelper
  def order_state_label(order)
    content = ''
    label_type = order.state == 'new' ? 'success' : 'default'
    label = content_tag(:span, t("activerecord.attributes.order.states.#{order.state}"), class: "label label-#{label_type}")
    content << content_tag(:h4, label, style: 'display:inline;')


    if order.state == 'new'
      icon = content_tag(:span, '', class: 'glyphicon glyphicon-ok', style: 'color:rgb(59, 195, 185);')
      content << link_to(icon, update_state_admin_order_path(order, state: 'sended'), class: 'btn btn-default btn-sm', style: 'margin-left: 5px;', title: 'Отметить Отправленным')
    end
    raw(content)
  end
end
