module ApplicationHelper
  def date_format(date)
    return '' if date.blank?

    date.to_date.strftime('%d/%m/%Y')
  end

  def icon_link(icon_name, icon_text, class_name='mx-1', size='1x')
  	fa_icon "#{icon_name}", text: "#{icon_text}", class: class_name, size: size
  end
end
