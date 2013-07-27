class Course < ActiveRecord::Base

  has_many :rounds

  attr_accessible :name, :rating, :slope, :tee
end
