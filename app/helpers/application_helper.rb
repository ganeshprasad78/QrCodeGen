module ApplicationHelper
  def date_format(date)
    return '' if date.blank?

    date.to_date.strftime('%d/%m/%Y')
  end
end
