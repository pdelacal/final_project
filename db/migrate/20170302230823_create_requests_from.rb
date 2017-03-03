class CreateRequestsFrom < ActiveRecord::Migration[5.0]
  def change
    create_table :requests_from, id: false do |t|
      t.integer :from_user_id
      t.integer :to_user_id
    end

    add_index(:requests_from, [:from_user_id, :to_user_id], :unique => true)
  end
end
