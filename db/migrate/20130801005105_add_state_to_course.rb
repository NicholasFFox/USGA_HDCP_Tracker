class AddStateToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :us_state, :string
  end
end
