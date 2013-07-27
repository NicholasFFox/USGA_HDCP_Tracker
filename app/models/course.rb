class Course < ActiveRecord::Base

  has_many :rounds

  attr_accessible :name, :rating, :slope, :tee


  def print_tee 
    "#{name} - #{tee}"
  end
  
end
