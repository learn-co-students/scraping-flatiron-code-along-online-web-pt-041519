require 'nokogiri'
require 'open-uri'
require "pry"

require_relative './course.rb'

class Scraper

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

  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses
    get_page.css("h2")
  end

  def make_courses
    course = Course.new
      course.title = get_courses.text
      course.schedule = get_courses.css("#date").text
      course.description = get_courses.css("p").text
  end
end
