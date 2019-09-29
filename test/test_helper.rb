ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
  parallelize(workers: 2, with: :threads)
  # parallelize(workers: 2)

  parallelize_setup do |worker|
    # 並列テスト前の処理を設定
  end

  parallelize_teardown do |worker|
    # 並列テスト後の処理を設定
  end
end
