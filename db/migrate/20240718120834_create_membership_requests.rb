class CreateMembershipRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :membership_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :club, null: false, foreign_key: true
      t.boolean :approved

      t.timestamps
    end
  end
end
