# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

RoleUser.delete_all
User.delete_all
Role.delete_all
Source.delete_all
NirType.delete_all
ScientificSchool.delete_all
Field.delete_all
Grnti.delete_all
StateProgram.delete_all

rs = Role.create([{name: :admin, info: 'Администратор системы'},
  {name: :rector, info: 'Ректор университета'}])
u = User.create({login: :radigin, info: 'Радыгин В.Ю.'})
u1 = User.create({login: :soa40, info: 'Сундукова О.А.'})
rus1 = RoleUser.create([{role: rs[0], user: u1}, {role: rs[1], user: u1}])
rus = RoleUser.create([{role: rs[0], user: u}, {role: rs[1], user: u}])

sor = Source.create([{funding_source: 'собственные средства организации'},{funding_source: 'средства федерального бюджета'},{funding_source: 'средства бюджета субъекта Федерации'},{funding_source:'средства местного бюджета'},{funding_source:'средства фонда стабилизации экономики'},{funding_source:'средства фонда регионального развития'},{funding_source:'средства из иностранного источника'}])

nir_t = NirType.create([{name: 'Фундаментальная'},{name: 'Научная'},{name: 'Поисковая'}]) 

sc_sch = ScientificSchool.create([{name: 'научная школа Роганова Е.А.'},{name: 'научная школа Радыгина В.Ю.'},{name: 'научная школа Пушкаря Е.А.'}])

fld = Field.create([{name: 'Физико - математические науки', code:  '01.00.00'},{name: 'Химические науки', code:  '02.00.00'},{name: 'Биологические науки', code:  '03.00.00'},{name: 'Геолого-минералогические науки ', code:  '04.00.00'},{name: 'Технические науки', code:  '05.00.00'},{name: 'Сельскохозяйственные науки', code:  '06.00.00'},{name: 'Исторические науки ', code:  '07.00.00'},{name: 'Экономические науки', code:  '08.00.00'},{name: 'Философские науки', code:  '09.00.00'},{name:'Филологические науки ', code:  '10.00.00'},{name:'Географические науки', code:  '11.00.00'},{name: 'Юридические науки', code:  '12.00.00'},{name: 'Педагогические науки', code:  '13.00.00'},{name: 'Медицинские науки', code:  '14.00.00'},{name: 'Фармацевтические науки', code:  '15.00.00'},{name: 'Ветеринарные науки', code:  '16.00.00'},{name: 'Искусствоведение', code:  '17.00.00'},{name: 'Архитектура', code:  '18.00.00'},{name: 'Психологические науки', code:  '19.00.00'},{name: 'Социологические науки', code:  '22.00.00'},{name: 'Политические науки', code:  '23.00.00'},{name: 'Культурология', code:  '24.00.00'},{name: 'Науки о Земле', code:  '25.00.00'}])

stp = StateProgram.create([{name: 'Развитие профессионального образования '},{name: 'Федеральная целевая программа развития образования на 2011-2015 годы'},{name: 'Федеральная целевая программа развития здравоохранения'}])

grn = Grnti.create([{grnti: '28.25.15', name: 'Анализ и синтез конечных автоматов'},{grnti: '28.25.19', name: 'Абстрактные машины'},{grnti: '28.25.23', name: 'Кибернетические аспекты структурно-логической теории алгоритмов и программирования'},{grnti: '28.21.15', name: 'Теория сигналов'},{grnti: '28.21.19', name: 'Теория кодирования'},{grnti: '28.21.27', name: ' Структуры систем передачи данных'},{grnti: '28.23.01', name: 'Общие вопросы искусственного интеллекта'},{grnti: '28.23.02', name: 'Общие проблемы искусственного интеллекта'},{grnti: '28.23.11', name: 'Языки представления и языки манипулирования знаниями'},{grnti: '28.23.15', name: 'Распознавание образов. Обработка изображений'},{grnti: '28.23.17', name: 'Логика в искусственном интеллекте'},{grnti: '28.23.19', name: 'Эвристические методы'},{grnti: '28.23.19', name: 'Эвристические методы'},{grnti: '28.23.20', name: 'Формирование решений в интеллектуальной среде. Модели рассуждений'}])
