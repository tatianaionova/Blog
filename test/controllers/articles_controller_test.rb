require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "Should not save article without title" do
  article = Article.new
  assert !article.save, "Saved the article without a title"
end
end
