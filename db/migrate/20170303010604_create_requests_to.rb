class CreateRequestsTo < ActiveRecord::Migration[5.0]
  def change
    create_table :requests_to do |t|
      t.integer :from_user_id
      t.integer :to_user_id
    end
    add_index(:requests_from, [:to_user_id, :from_user_id], :unique => true)
  end
end
