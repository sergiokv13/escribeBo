class AddSleepToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :sleep, :boolean
  end
end
