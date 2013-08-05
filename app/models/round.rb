class Round < ActiveRecord::Base

  belongs_to :user
  belongs_to :tee 
  
  attr_accessible :tee_id, :score, :user_id, :played_on

  validates :user_id, presence: true
  validates :tee_id, presence: true
  validates :score, presence: true,
                    numericality: {greater_than: 17}


  def fill_hdcp
    diff = score - tee.rating
    temp = diff * 113
    hdcp = temp/tee.slope
    self.hdcp = hdcp.round(1)
  end

end
