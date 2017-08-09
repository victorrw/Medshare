class AddDescriptionToMeds < ActiveRecord::Migration[5.0]
  def change
    add_column :meds, :description, :text
  end
end
