class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :nome
      t.text :description
      t.date :date
      t.integer :user_id
      t.string :stats

      t.timestamps
    end
  end
end
