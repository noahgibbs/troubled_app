class CreateOddsAndEnds < ActiveRecord::Migration
  def change
    create_table :odds_and_ends do |t|
      t.integer :a_number
      t.string :a_string, :length => 1024
      t.integer :parent_id
      t.integer :first_child_id
      t.integer :second_child_id
      t.integer :third_cousin_id
      t.integer :childhood_nickname_id
    end
  end
end
