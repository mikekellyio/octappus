class CreateDetailSteps < ActiveRecord::Migration
  def change
    create_table :detail_steps do |t|
      t.string :title
      t.text :content
      t.integer :parent_id, index: true

      t.timestamps null: false
    end
  end
end
