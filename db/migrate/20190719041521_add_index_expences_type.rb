class AddIndexExpencesType < ActiveRecord::Migration[5.2]
  def change
    add_index  :expences, :type
  end
end
