require 'test_helper'

class Api::ArticleTopicsControllerTest < ActionDispatch::IntegrationTest
  test 'should get topics' do
    get api_article_topics_url
    assert_json_collection response_json_body, %w(id name)
  end
end
