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
    
    articles = Article.select(:id).all.load
    people = Person.select(:id, :last_name).all.load
    srand(Time.now.to_i)
    ArticleAuthor.populate 100 do |conn|
        seed1 = rand(people.size)
        seed2 = rand(articles.size)
        conn.person_id = people[seed1].id
        conn.old_lastname = people[seed1].last_name
        conn.article_id = articles[seed2].id 
        #conn.details = 
    end

  end

end
