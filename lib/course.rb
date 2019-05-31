class Course
  attr_accessor :title, :schedule, :description #setter/getter reader/writer

  @@all = []

  def initialize
    @@all << self
  end

  def self.all #Class #setter/writer
    @@all
  end

  def self.reset_all
    @@all.clear
  end

end
