class Course < ActiveRecord::Base

  has_many :rounds

  attr_accessible :name, :rating, :slope, :tee

  validates :name, presence: true

  validates :tee, presence: true,
                  uniqueness: {
                    scope: :name,
                    case_sensitive: false,
                    message: "This tee exists"
                  }
  validates :slope, presence: true
  validates :rating, presence: true

  def print_tee 
    "#{name} - #{tee}"
  end
  
end
