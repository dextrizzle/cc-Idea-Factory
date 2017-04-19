class AddLikesToIdeas < ActiveRecord::Migration[5.0]
  def change
    add_column :ideas, :likes, :integer
  end
end
