class ChartsController < ApplicationController
  def show
=begin
    @chart = {
      data: (2006 .. 2015).map { |year|
        { year: year.to_s, articles: 57^((year%10)**2) }
      },
      xkey: 'year',
      ykeys: ['articles'],
      labels: ['Количество статей']
    }
=end
    @chart = {
       data: (2012 .. 2015).map { |year|
        { label: "Количество статей в"+ "\n"+ year.to_s , value: 57^((year%10)**2) }
      },
       #data: [
          #{label: "Download Sales", value: 12},
          #{label: "In-Store Sales", value: 30},
          #{label: "Mail-Order Sales", value: 20}
        #]
    }
  end
end
