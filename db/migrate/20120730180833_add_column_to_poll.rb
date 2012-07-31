class AddColumnToPoll < ActiveRecord::Migration
  def change
    add_column :polls, :edit_url, :string
    add_column :polls, :vote_url, :string
  end
end
