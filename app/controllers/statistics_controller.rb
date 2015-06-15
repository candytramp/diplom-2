class StatisticsController < ApplicationController
  def index
     @article = Article.first
    puts @article.inspect
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ArticlePdf.new(@article, view_context)
        send_data pdf.render, filename: 
        "article_#{@article.created_at.strftime("%d/%m/%Y")}.pdf",
        type: "application/pdf", disposition: "inline"
      end
    end
  end
  def show
    @article = Article.first
    puts @article.inspect
    respond_to do |format|
      format.pdf do
        pdf = ArticlePdf.new(@article, view_context)
        send_data pdf.render, filename: 
        "article_#{@article.created_at.strftime("%d/%m/%Y")}.pdf",
        type: "application/pdf", disposition: "inline"
      end
    end
  end
end
