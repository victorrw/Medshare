class AddUrlToMeds < ActiveRecord::Migration[5.0]
  def change
    add_column :meds, :url, :string
  end
end
