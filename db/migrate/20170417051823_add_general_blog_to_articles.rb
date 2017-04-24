class AddGeneralBlogToArticles < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        query_insert=<<-SQL
        WITH general_blog as (INSERT INTO user_blogs (title, created_at, updated_at) VALUES ('GeneralBlog', current_timestamp, current_timestamp) ON CONFLICT (title) DO NOTHING returning id)
        UPDATE articles SET user_blog_id = (SELECT id FROM general_blog)
        WHERE user_blog_id is null;
        SQL
        execute(query_insert)
        say "Insert"
      end

      dir.down do
        query_delete=<<-SQL
        UPDATE articles SET user_blog_id = null
        WHERE user_blog_id = (SELECT id FROM user_blogs WHERE title='GeneralBlog');
        DELETE FROM user_blogs WHERE (title = 'GeneralBlog');
        SQL
        execute(query_delete)
        say "Delete"
      end
    end
  end
end
