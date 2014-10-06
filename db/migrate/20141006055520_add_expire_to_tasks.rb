class AddExpireToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :expired, :boolean
  end
end
