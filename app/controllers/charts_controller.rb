class ChartsController < ApplicationController
  def show
    @chart = {
      data: (2006 .. 2015).map { |year|
        { year: year.to_s, articles: 57^((year%10)**2) }
      },
      xkey: 'year',
      ykeys: ['articles'],
      labels: ['Количество статей']
    }
  end
end
