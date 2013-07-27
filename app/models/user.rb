class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :profile_name
  
  validates :first_name, presence: true
  validates :last_name, presence:true
  validates :profile_name, presence: true,
                           uniqueness: true,
                           format: {
                             with: /^[a-zA-Z0-9_-]+$/,
                             message: "Must be formatted correctly."
                           }

  has_many :rounds

  def rounds_played
    rounds.all.length
  end


  def how_many_rounds_in_calculation (num)
    case num
      when 5..6 then 1
      when 7..8 then 2
      when 9..10 then 3
      when 11..12 then 4
      when 13..14 then 5
      when 15..16 then 6
      when 17 then 7
      when 18 then 8
      when 19 then 9
      else 10
    end
  end


  def hdcp
    num_played = rounds_played
    if num_played < 5 
      "N/A"
    else 
      #setup calculation
      all_hdcps=[]
      self.rounds.all.each {|round| all_hdcps.append(round.hdcp)}
      sorted_hdcps = all_hdcps.sort
      num_rounds_used = how_many_rounds_in_calculation(num_played)
      sum = 0

      #generate total index
      (0...num_rounds_used).each { |i| sum += sorted_hdcps[i] }
      
      #calculate overall index
      avg=sum/num_rounds_used
      hdcp = avg * 0.96
      hdcp.round(1)
    end
  end

end
