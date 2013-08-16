class RemoveTeeFromCourse < ActiveRecord::Migration
  def change
    remove_column :courses, :tee
    remove_column :courses, :rating
    remove_column :courses, :slope
  end
end
