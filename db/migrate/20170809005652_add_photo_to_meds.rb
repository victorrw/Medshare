class AddPhotoToMeds < ActiveRecord::Migration[5.0]
  def change
    add_column :meds, :photo, :string
  end
end
