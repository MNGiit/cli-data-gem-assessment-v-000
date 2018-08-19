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

end

#x = Articles.new("Hello World!", "So I want to be a webdev...", "www.learn.co")
#binding.pry


