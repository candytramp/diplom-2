module LicencesHelper
  def chosen_options(table)
    table.all.collect{|a| [a.name, a.id]}
  end
end
