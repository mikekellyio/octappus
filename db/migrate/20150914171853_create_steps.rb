class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :name
      t.text :description
      
      t.integer :parent_id, :null => true, :index => true
      t.integer :lft, :null => false, :index => true
      t.integer :rgt, :null => false, :index => true

      # optional fields
      t.integer :depth, :null => false, :default => 0
      t.integer :children_count, :null => false, :default => 0
      

      t.timestamps null: false
    end
  end
end
