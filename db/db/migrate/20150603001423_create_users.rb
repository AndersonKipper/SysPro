class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nome
      t.string :email
      t.string :password
      t.date :date

      t.timestamps
    end
  end
end
