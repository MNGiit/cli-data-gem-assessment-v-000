require_relative "../lib/articles.rb"
require_relative "../lib/scraper.rb"
require 'pry'
class CommandLineInterface
  
  attr_accessor :scraped
  
  def greetings
    puts "Greetings! Below are the currently featured articles on howstuffworks.com!"
  end
  
  def print_articles
    Articles.all.each do |article|
      puts article.title
      puts article.blurb
      puts ""
    end
  end

  def scrape_for_featured_articles
    @scraped = Scraper.new
    return nil
  end
  
  def run
    greetings
    scrape_for_featured_articles
    print_articles
  end
  
  def scrape_selected_article(selected)
    @scraped.add_content_to_article(selected)
  end  
##experimenting  
  def ask_user_to_pick_article
    "Please enter a number between 1 to 5."
  end
  
  def get_user_input
    gets.strip
  end
  
  def convert_to_i(input)
    input.to_i
  end
  
  def print_selected_article(input)
    puts scrape_selected_article(Articles.all[input-1])
  end
  
  def valid_input?(input)
    input.between?(1, 5)
  end
  
  def validating_loop(input)
    valid_input?(input) == true ? print_selected_article(input) : pick_article
  end
  
  def pick_article
    puts ask_user_to_pick_article
    user_input = get_user_input
    input = convert_to_i(user_input)
    validating_loop(input)
  end
  
end


#practice zone
##############
##############

x = CommandLineInterface.new
x.scrape_for_featured_articles
y = Articles.all[0]
#x.scrape_selected_article(y)
puts y.content
binding.pry
