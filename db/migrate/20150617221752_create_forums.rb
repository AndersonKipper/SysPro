class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :name_user
      t.string :message
      t.date :data

      t.timestamps
    end
  end
end
