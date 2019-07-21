class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.references :input_user, foreign_key: { to_table: :users }
      t.string :type
      t.index :type
      t.references :pay_for_user, foreign_key: { to_table: :users }
      t.references :pay_for_group, foreign_key: { to_table: :groups }
      t.boolean :pay_user_flag
      t.references :pay_user, foreign_key: { to_table: :users }
      t.references :pay_group, foreign_key: { to_table: :groups }
      t.date :day
      t.integer :money
      t.references :category, foreign_key: true
      t.string :memo

      t.timestamps
    end
  end
end
