require_relative "../lib/articles.rb"
#Dir["/path/to/directory/*.rb"].each {|file| require file }
require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  
  attr_accessor :titles, :blurbs, :urls, :check_title
  BASE_URL = "https://www.howstuffworks.com/"
  #attr_accessor :doc, :titles
  
  def initialize
    @titles = titles
    @blurbs = blurbs
    @urls = add_urls
    self.create_article
    @urls = urls
  end
  
  def hsw
    Nokogiri::HTML(open(BASE_URL))
  end
  
  def search
    hsw.css("#module-features").css("div")
  end
  
  def titles
    search.css(".title").map { |item| item.text}
  end
  
  def blurbs
    search.css(".blurb").map { |item| item.text}
  end
  
  def get_urls
    hsw.css("#module-features").css("a").map { |item| item.attribute('href').value }
  end
  
  def url_duplicate_remover
    get_urls.uniq
  end
  
  def add_urls
    url_duplicate_remover.reject.with_index { |element, index| index >=1 && index <= 2 }
  end
  
  #Need methods to store scraped info into class Articles
  def create_article
    5.times do |i|
      Articles.new(titles[i], blurbs[i], urls[i])
    end
  end
  
  def show
    Articles.all
  end
  
  def urls
    #features = doc.css("#module-features").css("div")
    search.css("a href").map { |item| item.value}
  end
  
  #Unforunately some of my old code isn't here...
  
  def go_to(address = "https://health.howstuffworks.com/mental-health/sleep/disorders/why-people-fall-asleep-movie-theaters.htm")
    Nokogiri::HTML(open(address))
  end
  
  def add_content
    go_to.css(".infinite-item").css("p").text
  end
  
  def get_title
    @check_title = go_to.css("h1").text
  end
  
  def add_content_to_article
    Articles.all.each do |article|
      article.content = add_content if @check_title == article.title
    end
  end
  
end


x = Scraper.new
#testing out arrays
y = [ 0, 1, 2]
z = 3
#nyt = Articles.new
binding.pry

#HISTORY
#git commit -m "Added titles and blurbs."