class AddFrequencyToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :frequency, :string
  end
end
