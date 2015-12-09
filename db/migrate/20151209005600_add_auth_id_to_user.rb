class AddAuthIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :auth_id, :string, null: false
  end
end
