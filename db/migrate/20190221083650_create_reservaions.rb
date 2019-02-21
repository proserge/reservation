class CreateReservaions < ActiveRecord::Migration[5.2]
  def change
    create_table :reservaions do |t|
      t.integer :number
      t.datetime :time
      t.integer :duration
      t.references :user, foreign_key: true
      t.references :table, foreign_key: true

      t.timestamps
    end
  end
end
