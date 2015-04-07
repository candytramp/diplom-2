module ResearchEffortsHelper
  def chosen_options(table)
    if table == Source
      table.all.collect{|a| [a.funding_source, a.id]}
    else
      table.all.collect{|a| [a.name, a.id]}
    end
  end
end
