class CreateAuthor < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.integer :employee_id
      t.integer :customer_id

      t.timestamps
    end
  end
end

