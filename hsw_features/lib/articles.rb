require 'pry'
class Articles

  attr_accessor :title, :blurb, :url, :content

  @@all = []
  
  def initialize (title = nil, blurb = nil, url = nil)
    @title = title
    @blurb = blurb
    @url = url
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  ### below will be code that will check if the article exists, create article, and maybe update article
  def self.find_by_title(article_title)
    return_me = nil
    self.all.each do |article|
      if article.title == article_title
        return_me = article
      end
    end
    return_me
  end
  
  #def self.find_or_create_by_title(article_title)
  #  self.find_by_title(article_title)? self.find_by_title(article_title) : self.new(article_title)
  #end
  
  #def create_article (title, blurb, url)
  #  Articles.new if article_doesnt_exist
  #end
  
end

x = Articles.new("Star Wars", "A Galaxy Far Far Away", "www.starwars.com")
y = Articles.new("Romeo and Juliet", "What a tragedy!", "www.amazon.com")
z = Articles.new("Story of the Internet", "You won't believe it!", "")
a = Articles.new("Game of Thrones", "Where are my dragons?!", "")
b = Articles.new("Abcs", "Important units of our language!", "gotoschool.com")

first_search = Articles.find_by_title("Star Wars")
second = Articles.find_by_title("Can't find me!")

binding.pry