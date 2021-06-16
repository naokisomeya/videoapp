class RenameCommentColumnToComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :comment, :comment_content
  end
end
