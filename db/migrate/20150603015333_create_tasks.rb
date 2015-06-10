class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :nome
      t.text :description
      t.date :dateStart
      t.date :dateEnd
      t.string :stats
      t.integer :project_id

      t.timestamps
    end
  end
end
