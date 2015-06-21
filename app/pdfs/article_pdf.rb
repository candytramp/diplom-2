class ArticlePdf < Prawn::Document
  def initialize(article, view)
    super(:page_layout => :portrait)
    @article = article
    @view = view
    gen_title
    gen_form3_monographs
  end
  def gen_title
    
    pril = "Приложение 1"
    header1 = "МИНИСТЕРСТВО ОБРАЗОВАНИЯ И НАУКИ РОССИЙСКОЙ ФЕДЕРАЦИИ"
    header2 = "Федеральное государственное бюджетное образовательное учреждение
высшего профессионального образования"
    header3 = "«Московский государственный индустриальный университет» "
    ytverjdau = "УТВЕРЖДАЮ"
    prorecter = "Проректор по научной работе"
    shlapin = "______________ Шляпин А.Д."
    data = "«____»__________2015 г."
    onchet = "ОТЧЕТ"
    onauchd = "о научной деятельности"

    kaf_name = "(наименование кафедры)"
    god = "за 2014 г."
    zavkaf = "Заведующий кафедры"
    cherta = "____________________ "
    director = "Директор"
    footer = "МОСКВА 2015"
    font('./fonts/TimesNewRomanRegular.ttf') do
      
      text  pril,
            :align => :right,
            :width => 200,
            :height => 50
    end
    font('./fonts/TimesNewRomanBold.ttf') do
      move_down 10
      text header1,
          :align => :center,
          :width => 2000,
          :height => 40
      move_down 30
      text header2,
          :align => :center,
          :width => 2000,
          :height => 40,
          :size => 12
      move_down 30
      text header3,
          :align => :center,
          :width => 2000,
          :height => 40,
          :size => 14
      move_down 40
      table  [['','',ytverjdau],['','',prorecter], ['','',shlapin],['','',data] ],
             :cell_style => {:align => :center, :borders => []},
             :position => :right
      move_down 60
      text "ОТЧЕТ",
          :align => :center,
          :width => 2000,
          :height => 40,
          :size => 18
      move_down 5
      text onauchd,
          :align => :center,
          :width => 2000,
          :height => 40,
          :size => 16
      move_down 30    
      stroke_horizontal_rule
      end
    font('./fonts/TimesNewRomanRegular.ttf') do
      move_down 5
      text kaf_name,
          :align => :center,
          :width => 2000,
          :height => 40,
          :size => 14
    end
    font('./fonts/TimesNewRomanBold.ttf') do
      move_down 10
      text god,
          :align => :center,
          :width => 2000,
          :height => 40,
          :size => 14
    end
    font('./fonts/TimesNewRomanRegular.ttf') do
      data = [[zavkaf, cherta], [director, cherta]]
      move_down 60
      table data,
          :cell_style => {:borders => []},
          :position => :center,

          :width => 500 do
            self.column_widths = { 0 => 250, 1 => 250 }
            self.columns(0).style(:align => :left)
            self.columns(1).style(:align => :right)
          end
      move_down 160
      text footer,
          :align => :center,
          :width => 2000,
          :height => 40,
          :size => 14
    end
  end

  def gen_form3_monographs
    start_new_page(:layout=>:landscape)
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
  start_new_page
  end
end
