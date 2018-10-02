class Scraper
  
  attr_accessor :titles, :blurbs, :urls, :check_title
  BASE_URL = "https://www.howstuffworks.com/"

  def initialize
    #@titles = titles
    #@blurbs = blurbs
    #@urls = add_urls
    self.create_article
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
  
  def create_article
    search.each do |i|
      title = i.css(".title").text
      blurb = i.css(".blurb").text
      url = i.css("a").attribute("href").value
      Articles.new(title, blurb, url) if (title != nil && blurb != nil && url != nil)
      #binding.pry
    end
  end
  
  def show
    Articles.all
  end
  
  def go_to(address)
    puts "******Scraping*******"
    Nokogiri::HTML(open(address))
  end
  
  def add_content_to_article(article)
    doc = go_to(article.url)
    article.content = doc.css(".infinite-item").css("p").text
  end
  
end



