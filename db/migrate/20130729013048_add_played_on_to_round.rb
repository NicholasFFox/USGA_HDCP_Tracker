class AddPlayedOnToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :played_on, :date
  end
end
