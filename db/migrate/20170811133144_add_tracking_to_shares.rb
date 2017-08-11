class AddTrackingToShares < ActiveRecord::Migration[5.0]
  def change
    add_column :shares, :tracking, :string
  end
end
