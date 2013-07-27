class Round < ActiveRecord::Base

  belongs_to :user
  belongs_to :course 
  
  attr_accessible :course_id, :score, :user_id


  def self.minimum_score?
    score >=18
  end

  def round_hdcp
    diff = score - course.rating
    temp = diff * 113
    hdcp = temp/course.slope
    hdcp.round(1)
  end

end
