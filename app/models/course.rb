class Course < ActiveRecord::Base

  has_many :rounds
  has_many :tees

  attr_accessible :name, :us_state

  validates :name, presence: true,
                   uniqueness: {
                   scope: :us_state,
                   case_sensitive: false,
                   message: "This Course exists"
                  }
  validates :us_state, presence: true
  
end
