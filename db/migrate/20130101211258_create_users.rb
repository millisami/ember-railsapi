class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text    :quote
      t.string  :first_name
      t.string  :last_name
      t.integer :age

      t.timestamps
    end
  end
end
