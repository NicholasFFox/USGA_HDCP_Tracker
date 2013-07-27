class AddHdcpToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :hdcp, :float
  end
end
