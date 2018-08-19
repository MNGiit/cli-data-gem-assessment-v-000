require 'pry'
class Articles
  attr_accessor :title, :blurb, :url
  
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
  
end

#puts "Hello World!"
#x = Articles.new("Hello World!", "So I want to be a webdev...", "www.learn.co")
#binding.pry

#HISTORY
#git commit -m "Added 3 instance variables for Class Articles"