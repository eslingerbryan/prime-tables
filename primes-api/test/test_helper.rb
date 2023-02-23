ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Add more helper methods to be used by all tests here...
  def max_time
    # TODO proper config value
    30
  end

  def with_timeout(context, &blk)
    Timeout::timeout(max_time, &blk)
  rescue Timeout::Error
    assert false, message { "#{context} exceeded max time of #{max_time} sec" }
  end
end
