ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  include Devise::Test::IntegrationHelpers

  fixtures :all

  def response_json_body
    JSON.parse(@response.body)
  end

  def assert_json_collection(object, attrs)
    assert_kind_of Array, object
    assert object.all? { |element| (element.keys <=> attrs) >= 0 }
  end

  def assert_json_resource_attrs(object, attrs)
    assert (object.keys <=> attrs) >= 0
  end
end
