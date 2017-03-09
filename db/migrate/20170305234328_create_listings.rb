class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.belongs_to :user, foreign_key: true
      t.string :address
      t.string :rent
      t.string :amenities
      t.string :rules
      t.string :photo
      t.text :description

      t.timestamps
    end
  end
end
