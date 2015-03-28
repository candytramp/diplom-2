module DiplomasHelper
  def options_for_chosen
    result = []
    tables = [Article, Conference, Exhibit, Exhibition, Monograph, Report, Textbook]
    Diploma::REWARD_TYPES.each do |table|
      if table.all.any?
        puts table.inspect
        result += (table.all.collect{|a| [a.name,"#{table}/#{a.id}"]})
      end
    end
    puts result.inspect
    return result
  end
end
