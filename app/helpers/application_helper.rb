module ApplicationHelper
  
  def print_date(date)

    if date.nil?
      "Sem data"
    elsif date == Time.current.to_date
      "Hoje"
    elsif date == Date.yesterday
      "Ontem"
    elsif date == Date.tomorrow
      "Amanhã"
    elsif date && (date > Time.current.to_date - 7.days) && (date < Date.yesterday)
      l(date, format: '%A')
    else
      if date.year == Date.today.year
        l(date, format: '%-d de %B')
      else
        l(date, format: '%-d de %B de %Y')
      end
    end

  end

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do 
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message 
            end)
    end
    nil
  end

  def all_currencies(hash)
    hash.keys.map(&:upcase)
  end

  def is_active?(to_test, current)
    return 'active' if to_test == current
    ''
  end

end