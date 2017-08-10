class AddStatusToShares < ActiveRecord::Migration[5.0]
  def change
    add_column :shares, :status, :string
  end
end
