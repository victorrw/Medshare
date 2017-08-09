class AddCoordinatesToMeds < ActiveRecord::Migration[5.0]
  def change
    add_column :meds, :latitude, :float
    add_column :meds, :longitude, :float
  end
end
