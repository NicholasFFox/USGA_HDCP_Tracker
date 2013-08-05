class SwapTeeAndCourseInRound < ActiveRecord::Migration
  def change
    remove_column :rounds, :course_id
    add_column :rounds, :tee_id, :integer
  end
end
