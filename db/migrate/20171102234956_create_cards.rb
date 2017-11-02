class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :title
      t.string :description
      t.decimal :price

      t.timestamps
    end
  end
end
