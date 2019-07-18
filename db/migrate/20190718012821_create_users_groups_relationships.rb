class CreateUsersGroupsRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :users_groups_relationships do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.string :position

      t.timestamps
      
      t.index [:user_id, :group_id], unique: true
    end
  end
end
