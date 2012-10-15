class RenameCompletedToCompletedAt < ActiveRecord::Migration
  def up
    change_table :tasks do |t|
      t.rename :completed, :completed_at
    end
  end
  def down
    change_table :tasks do |t|
      t.rename :completed_at, :completed
    end
  end
end
