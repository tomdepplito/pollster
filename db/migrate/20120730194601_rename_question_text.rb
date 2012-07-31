class RenameQuestionText < ActiveRecord::Migration
  def up
    rename_column :questions, :text, :content
  end

  def down
  end
end
