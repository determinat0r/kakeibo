class CreateMonths < ActiveRecord::Migration[5.2]
  def change
    create_table :months do |t|
      t.references :group, foreign_key: true
      t.date :open_day

      t.timestamps
    end
  end
end
