class AddUniqueIndexToUserBlogs < ActiveRecord::Migration[5.0]
  def change
    add_index(:user_blogs, :title, unique: true)
  end
end
