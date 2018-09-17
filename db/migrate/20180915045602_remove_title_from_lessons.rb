class RemoveTitleFromLessons < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :title, :string
  end
end
