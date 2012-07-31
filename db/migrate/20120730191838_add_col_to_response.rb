class AddColToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :text, :string
  end
end
