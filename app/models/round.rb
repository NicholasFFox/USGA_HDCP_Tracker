class Round < ActiveRecord::Base

  belongs_to :user
  belongs_to :course 
  
  attr_accessible :course_id, :score, :user_id, :played_on

  validates :user_id, presence: true
  validates :course_id, presence: true
  validates :score, presence: true,
                    numericality: {greater_than: 17}


  def fill_hdcp
    diff = score - course.rating
    temp = diff * 113
    hdcp = temp/course.slope
    self.hdcp = hdcp.round(1)
  end

end
