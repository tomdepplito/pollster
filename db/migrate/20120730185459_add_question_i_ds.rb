class AddQuestionIDs < ActiveRecord::Migration
  def up
    remove_column :responses, :poll_id
    add_column    :responses, :question_id, :integer   
  end

  def down
  end
end
