require 'net/http'
require 'nokogiri'

class Grnti
  attr_reader :number, :title

  def initialize(number, title)
    @number = number
    @title = title
  end
end

grnt_list = []
import_path = ['/']

while !import_path.empty?
  Nokogiri::HTML(Net::HTTP.get('grnti.ru', import_path.shift)).css('ul.grnt_list li a').each do |item|
    sublist_path = item.attr('href')
    #import_path.push(sublist_path) if sublist_path[0] == '/'
    import_path.push(sublist_path) if sublist_path =~ /^\/\?p1=\d+&p2=\d+&p3=\d+$/  #p1=12&p2=51&p3=01
    number = item.children[0].text
    title = item.children[1 .. -1].map(&:text).join
    grnt_list << Grnti.new(number, title)
    
    puts "IMPORT #{number} #{title}"
  end
end
