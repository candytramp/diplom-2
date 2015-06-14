class ArticlePdf < Prawn::Document
  def initialize(article, view)
    super()
    @article = article
    @view = view
    text "This is an article statistics!"
    kaf_stat
  end
  def kaf_stat
    invoiceinfo = [["Item Name", "#{ @article.name }"], ["Year", "#{ @article.year }"],["Link", "#{ @article.link }"]]
    move_down 30
    table invoiceinfo,
      :header => true,
      :width => 500 do
        columns(0).align = :left
        columns(1).align = :right
        self.header = true
        self.column_widths = {0 => 200, 1 => 300}
        columns(2).font_style = :bold
      end
      
  end
end
