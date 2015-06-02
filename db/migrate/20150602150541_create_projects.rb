class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.primary_Key :id
      t.string :name
      t.text :description
      t.date :date
      t.integer :userId
      t.string :stats

      t.timestamps
    end
  end
end
