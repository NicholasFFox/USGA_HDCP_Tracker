class Tee < ActiveRecord::Base
  attr_accessible :color, :course_id, :rating, :slope

  belongs_to :course
  has_many :rounds

  validates :color, presence: true,
                    uniqueness: {
                    scope: :course_id,
                    case_sensitive: false,
                    message: "This Tee exists"
                  }

  validates :course_id, presence: true
  validates :slope, presence: true
  validates :rating, presence: true

  def print_tee
    "#{course.name} - #{color}"
  end

end
