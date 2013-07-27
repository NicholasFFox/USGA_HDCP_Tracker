class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :tee
      t.float :rating
      t.float :slope

      t.timestamps
    end
  end
end
