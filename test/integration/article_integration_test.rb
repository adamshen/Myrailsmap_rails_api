require 'test_helper'

class ArticleIntegrationTest < ActionDispatch::IntegrationTest
  test "should get articles" do
    get api_articles_url
    assert_json_collection response_json_body, %w(id title)
  end

  test "should get article" do
    get api_articles_url
    id = response_json_body.sample.fetch('id')

    get api_article_url(id)
    assert_json_resource_attrs response_json_body, %w(id title content article_topic_id)
  end
end
