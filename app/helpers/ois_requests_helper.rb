module OisRequestsHelper
  def options_for_object
    ['изобретение','полезная модель','промышленный образец','программа для ЭВМ','база данных','товарный знак']
  end

  def options_for_status
    ['российская', 'международная']
  end

  def chosen_options(table)
    table.all.collect{|a| [a.name, a.id]}
  end
end
