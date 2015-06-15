class ArticlePdf < Prawn::Document
  def initialize(article, view)
    super(:page_layout => :landscape)
    @article = article
    @view = view
    gen_form3_monographs
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
  def gen_form3_monographs
    page_header = "РЕЗУЛЬТАТИВНОСТЬ НИР В 2014 Г."
    table_1_header = ["№ п/п","Название статьи", "Автор(ы)", "Вид публикации", "Выходные данные статьи", "Страна", "Объем (п.л.)", "Принадлежность к НИР", "РИНЦ"]
    table_1_data = []
    table_1_data = table_1_data.push(table_1_header)
    table_1_data.push(
          [1, "Пути повышения эффективности образовательного процесса с применением дистанционных образовательных технологий", "Иванов М.Н., Егоркина Е.Б.", "Материалы конференции","VII Международная научно-практическая конференция «Новые информационные технологии в образовании «НИТО-2014»» : Материалы. – Екатеринбург: Издательство УМЦ УПИ, 2014 –С. 323-326.", "Россия", "0,2", "нет", "нет"])
    table_1_data.push(
          [2, "Использование дистанционных образовательных технологий в единой информационно-образовательной среде ФГБОУ ВПО «МГИУ»", "Иванов М.Н., Попова Е.П.", "Материалы конференции", "Международная научно-методическая конференция «Информатизация инженерного образования» – ИНФОРИНО-2014: Труды. – М.: Издательство МЭИ, 2014 –С. 423-424.", "Россия", "0,1", "нет", "нет"])
    table_1_data.push(
         [3,"Перспективы использования электронного обучения и дистанционных образовательных технологий", "Егоркина Е.Б., Иванов М.Н.","Материалы конференции", "XXI Всероссийск. науч.-методич. конф. «Телематика'2014»: Труды. – Спб: Университетские телекоммуникации, 2014 –С. 37-38.", "Россия", "0,1", "нет", "нет"])

=begin
    arr = PeopleTextbook.all.limit(5)
    arr_authors = []
    arr.each do |book|
      b =[]
      aus = PeopleTextbook.includes(:textbook, :person).where('textbook_id = ?', book.textbook.id)
      aus.each do |per|
        b << per.person.full_name
      end
      arr_authors << b
    end

    table_1_data = []
    table_1_data = table_1_data.push(table_1_header)
    i = 0
    arr.each do |book|
      table_1_data << [i+1, book.textbook.title, "#{arr_authors[i].join(", ")}", "",book.textbook.publisher, "", book.textbook.pages]
      i += 1
    end
=end


    font('./fonts/TimesNewRomanRegular.ttf') do
      text  page_header,
            :align => :center,
            :width => 2000,
            :height => 50
      move_down 5
      text  "Форма 3",
            :align => :right
      move_down 5
      text "3.5 Публикации статей сотрудников и преподавателей"
      move_down 5
      table  table_1_data, 
             :header => true,
             :cell_style => {:align => :center},
             :width => 730 do
                self.column_widths = { 1 => 120, 2 => 80, 3 => 90,4 => 100 }
             end
    end
  end
end
