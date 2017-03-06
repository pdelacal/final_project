class RemoveRulesFromListings < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :rules, :string
  end
end
