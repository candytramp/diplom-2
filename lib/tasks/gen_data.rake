namespace :db do
  desc "Generating fake data"
  task :gen_data => :environment do
    require 'populator'
    require 'faker'
    models = [Textbook, Monograph, Exhibition, Conference, Person, Licence, OisRequest, Article]
    inner_models = [Exhibit, Report]

    models.each(&:destroy_all)
    inner_models.each(&:destroy_all)

    models.each do |model|
      model.populate 100 do |el|
        if model == Textbook
          el.isbn = Faker::Code.isbn
          el.title = Faker::App.name
          el.publisher = ['Зарубежное издательство','Российское издательство: "Высшая школа"',
                          'Российское издательство: вуза (организации)','Российское издательство']
          el.grif = ['гриф УМО или НМС', 'гриф Рособразования (Минобразования России)', 
                     'гриф других федеральных органов исполнительной власти', 'другой гриф', 'без грифа']
          el.publish_year = [1960..2014].shuffle.first
          el.pages = Faker::Number.decimal(3,2)
          el.textbook_type =  ['учебник', 'учебное пособие', 'учебно-методическое пособие','методическое пособие']
        elsif model == Monograph
          el.isbn = Faker::Code.isbn
          el.name = Faker::App.name
          el.publisher = ['Зарубежное издательство','Российское издательство: "Высшая школа"',
                          'Российское издательство: вуза (организации)','Российское издательство']
          el.publish_year = [1960..2014].shuffle.first
          el.publisher_name = Faker::App.name
          el.pages = Faker::Number.decimal(3,2)
        elsif model == Exhibition
          el.name = Faker::App.name + "_#{rand(500)}"
          el.country = Faker::Address.country
          el.city = Faker::Address.city
          el.etype = ['международная','на базе вуза','региональная','всероссийская', 'другая']
          el.start = Faker::Date.between(Date.new(1999,1,1), Date.new(2014,12,31))
          el.finish = el.start + 1.week
          el.year = el.start.year
          Exhibit.populate 2..5 do |exht|
            exht.name = Faker::App.name + "_#{rand(450)}"
            exht.year = el.year
            exht.exhibition_id = el.id
          end
        elsif model == Conference
          el.name = Faker::App.name + "_#{rand(550)}"
          el.country = Faker::Address.country
          el.city = Faker::Address.city
          el.ctype = ['международная','на базе вуза','региональная','всероссийская', 'другое']
          el.start = Faker::Date.between(Date.new(1999,1,1), Date.new(2014,12,31))
          el.finish = el.start + 2.days
          el.year = el.start.year
          Report.populate 2..5 do |rep|
            rep.title = Faker::App.name + "_#{rand(450)}"
            puts el.id
            rep.conference_id = el.id
          end
        elsif model == Person
          el.last_name = Faker::Name.last_name
          el.first_name = Faker::Name.first_name
          el.birthday = Faker::Date.between(Date.new(1940,1,1), Date.new(1990,12,31))
        elsif model == OisRequest
          el.number = Faker::Lorem.word 
          el.priority = Faker::Date.between(Date.new(1970,1,1), Date.new(2014,12,31))
          el.author = Faker::Lorem.sentence
          el.name = Faker::App.name + "_#{rand(450)}"
          el.object = ['изобретение','полезная модель','промышленный образец','программа для ЭВМ','база данных','товарный знак']
          el.status = ['российская', 'международная']
          el.reg_agency = Faker::App.name
        elsif model == Licence
          el.number = Faker::Lorem.characters(10) + "_#{rand(5)}"
          el.reg_date = Faker::Date.between(Date.new(1970,1,1), Date.new(2014,12,31))
          el.name = Faker::App.name + "_#{rand(450)}"
          el.expiration_date = el.reg_date + 75.years
          el.ltype = Faker::Lorem.characters(30)
        elsif model == Article
          el.name = Faker::Lorem.word + "_#{rand(450)}"
          el.start_page = rand(500) + 1
          el.finish_page = el.start_page + rand(20) + 1
          el.link = Faker::Internet.url
          tt = Faker::Date.between(Date.new(1970,1,1), Date.new(2014,12,31))
          el.year = tt.year
          el.source = {}
          if (rand(2)+1) == 1
            el.source[:stype] = 'журнал'
            el.source[:name] = Faker::Lorem.word + "_#{rand(450)}"
            el.source[:year] = el.year - 1
            el.source[:output] = rand(50) + 1
            el.source[:is_russian] = [false,true].sample
            el.source[:in_rinc] = [false,true].sample
          else
            el.source[:stype] = 'сборник трудов'
            el.source[:name] = Faker::Lorem.word + "_#{rand(450)}"
            el.source[:year] = el.year - 1
          end
          el.source.to_json
        end
      end
    end
  end


  desc "Generating connections"
  task :gen_connections => :environment do
    require 'populator'
    models = [Textbook, Exhibition, Conference, Article, Exhibit, Report, Licence, OisRequest]
    conn_models = [[PeopleTextbook, "textbook_id="], [ExhibitionPerson, "exhibition_id="], [ConferencePerson, "conference_id="], [ArticleAuthor, "article_id="], [ExhibitPerson, "exhibit_id="], [PeopleReport, "report_id="],[LicencePerson, "licence_id="], [AuthorRequest, "ois_request_id="] ]
    works = []
    models.each do |model|
      works << model.select(:id).all.to_a
    end
    works = conn_models.zip(works)
    #articles = Article.select(:id).all.load
    people = Person.select(:id, :last_name).all.load
    insts = {
              'ИИТУ' => [ {'11' => 'информационных систем и технологий'},
                          {'12' => 'прикладной информатики' },
                          {'13' => 'информационной безопасности автоматизированных систем' },
                          {'14' => 'автоматики и управления в технических системах'},
                          {'15' => 'прикладной математики' },{'16' => 'физики' }],
              'ТИ' => [ {'21' => 'конструкторско-технологического обеспечения машиностроения'},
                        {'22' => 'машиностроения'},
                        {'23' => 'материаловедения и нанотехнологий'},
                        {'24' => 'графики и промышленного дизайна'},
                        {'25' => 'технической механики'},
                        {'26' => 'деталей машин и метрологии'},
                        {'27' => 'химии'}],
              'ИЭТС' => [ {'31' => 'автомобилей и двигателей'},
                          {'32' => 'промышленной теплоэнергетики'},
                          {'33' => 'энергомашиностроения'},
                          {'34' => 'безопасности жизнедеятельности и промышленной экологии'},
                          {'35' => 'эксплуатации транспортных средств'}],
              'ЮИ' => [ {'41' => 'трудового права и права социального обеспечения '},
                        {'42' => 'уголовного права и уголовного процесса'},
                        {'43' => 'теории государства и права и публичного права '},
                        {'44' => 'гражданского права и гражданского процесса '},
                        {'45' => 'административного и финансового права'}], 
              'ИЭУ' => [ {'51' => 'экономики предприятий и организаций '},
                         {'52' => 'менеджмента '},
                         {'53' => 'бухгалтерского учета, анализа и аудита '},
                         {'54' => 'финансов и кредита' },
                         {'55' => 'управления персоналом '},
                         {'56' => 'государственного и муниципального управления'},{'57' => 'экономической теории '}],
              'СГТИ' => [{'61' => 'философии и истории'},{'62' => 'иностранных языков'},{'63' => 'физического воспитания '},{'64' => 'русского языка и культуры речи '}], 
              'ИДО' => [{'71' => 'менеджмент  организации'},{'72' => 'экономика'},{'73' => 'правовые дисциплины'},{'74' => 'конструкторско-технологическое обеспечение предприятий'},{'75' => 'гуманитарные и социальные дисциплины'}]
            }
    
    srand(Time.now.to_i)
    zip_buffer = []
    people.each do |person|
      inst_num = rand(insts.size)
      inst_name = insts.to_a[inst_num][0]
      kaf = insts.to_a[inst_num][1][rand(insts.to_a[inst_num][1].size)]
      zip_buffer << [inst_name, kaf]
    end
    people = people.zip(zip_buffer)
    people.each do |person|
      works.each do |work|
        seed1 = rand(2)
        if seed1 ==0
          work[0][0].populate 1 do |conn|
            seed2 = rand(work[1].size)
            conn.person_id = person[0].id
            conn.old_lastname = person[0].last_name
            conn.send(work[0][1], work[1][seed2].id) 
            conn.details = {inst: person[1][0], kaf: person[1][1]}
          end
        else
          work[0][0].populate 0 do |conn|
            seed2 = rand(work[1].size)
            conn.person_id = person[0].id
            conn.old_lastname = person[0].last_name
            conn.send(work[0][1], work[1][seed2].id) 
            conn.details = {inst: person[1][0], kaf: person[1][1]}
          end
        end
      end
    end
  end

end
