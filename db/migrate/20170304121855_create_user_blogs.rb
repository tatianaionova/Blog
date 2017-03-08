class CreateUserBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :user_blogs do |t|
      t.string :title
      t.timestamps
    end
  end
end
