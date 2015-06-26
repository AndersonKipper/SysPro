class AddFieldsToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :user_email, :string
  end
end
