class Round < ActiveRecord::Base

  belongs_to :user
  belongs_to :course 
  
  attr_accessible :course_id, :score, :user_id

end
