class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.belongs_to :user, foreign_key: true
      t.string :age_early_20s
      t.string :age_late_20s
      t.string :age_30s
      t.string :age_40s_older
      t.string :gender
      t.string :budget_min
      t.string :budget_max
      t.string :move_in_date
      t.string :duration
      t.string :pet_dog
      t.string :pet_cat
      t.string :pet_other
      t.string :like_pet_dog
      t.string :like_pet_cat
      t.string :like_pet_other
      t.string :wakeup
      t.string :bedtime
      t.string :work
      t.string :work_from_home
      t.string :overnight_guests
      t.string :relationship
      t.string :relationship_type
      t.string :smoking
      t.string :messy
      t.string :environment
      t.string :party
      t.string :communicator
      t.string :friends_over
      t.string :drink
      t.string :visitors

      t.timestamps
    end
  end
end
