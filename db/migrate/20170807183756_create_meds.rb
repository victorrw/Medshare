class CreateMeds < ActiveRecord::Migration[5.0]
  def change
    create_table :meds do |t|
      t.string :name
      t.date :exp_date
      t.references :share, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
