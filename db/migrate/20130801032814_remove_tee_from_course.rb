class RemoveTeeFromCourse < ActiveRecord::Migration
  def change
    remove_column :rounds, :tee
    remove_column :rounds, :rating
    remove_column :rounds, :slope
  end
end
