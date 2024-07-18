class AddPresidentToClubs < ActiveRecord::Migration[7.1]
  def change
    add_column :clubs, :president_id, :integer
  end
end
