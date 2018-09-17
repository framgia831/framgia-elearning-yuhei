class RemoveContentFromLessons < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :content, :string
  end
end
