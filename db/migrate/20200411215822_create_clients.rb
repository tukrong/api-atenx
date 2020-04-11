class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :description, null: false
      t.integer :duration, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
