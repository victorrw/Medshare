class CreateShares < ActiveRecord::Migration[5.0]
  def change
    create_table :shares do |t|
      t.references :user, foreign_key: true
      t.integer :shipping

      t.timestamps
    end
  end
end
