require_relative "../lib/articles.rb"
require_relative "../lib/scraper.rb"
require 'pry'
class CommandLineInterface
  
  attr_accessor :scraped
  
  def initialize
    scrape_for_featured_articles
  end
  
  def greetings
    puts "Greetings! Below are articles currently featured on howstuffworks.com!"
    puts ""
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
  end
  
  def scrape_selected_article(selected)
    @scraped.add_content_to_article(selected)
  end
  
##experimented and it works 
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
    puts ""
    puts ask_user_to_pick_article
    user_input = get_user_input
    input = convert_to_i(user_input)
    validating_loop(input)
  end
##experimented and it works 

  def ask_user_read_another
    puts ""
    puts "Want to read another article? Enter 1 to see the list again. Enter anything else to quit."
  end
  
##experimenting  
  def pick_another_article?
    ask_user_read_another
    number = convert_to_i(get_user_input)
    print_articles if number == 1
    pick_article if number == 1
  end
  
  def run
    continue = true
    greetings
    while continue == true
      print_articles
      pick_article
      ask_user_read_another
      number = convert_to_i(get_user_input)
      continue = false if number != 1
    end
  end
  
end


#practice zone
##############
##############

#x = CommandLineInterface.new

#binding.pry

##experimenting...again!  
  #def check_article_for_contents(input)
  #  article = Articles.all[input-1]
  #  article.content == nil?
  #  #puts article.content if article.content != nil
  #end

