require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
    
  def get_page 
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    
    # doc.css(".post").each do |post|
    #   course = Course.new 
    #   course.title = post.css("h2").text 
    #   course.schedule = post.css(".date").text 
    #   course.description = post.css("p").text 
    # end 
  end 
  
    #calls on .make_courses and then iterates over all of the courses that get created to puts out a list of course offerings.
    def print_courses
      self.make_courses
      Course.all.each do |course|
        if course.title
          puts "Title: #{course.title}"
          puts "  Schedule: #{course.schedule}"
          puts "  Description: #{course.description}"
        end
      end
    end
  
  #responsible for using css sel to grab all html elements that contain a course. Return value will be a collection of xml elements, each of which describes a course offering.
  def get_courses
    self.get_page.css(".post")
  end 
  
  #responsible for actually instantiating Course objects and giving each course object the correct title, schedule and description attribute that we scraped from the page.
  def make_courses
    self.get_courses.each do |post|
      course = Course.new 
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text 
      course.description = post.css("p").text 
    end 
  end 
  
end
Scraper.new.print_courses



