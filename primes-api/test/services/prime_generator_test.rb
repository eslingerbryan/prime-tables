require "test_helper"


class PrimeGeneratorTest < ActiveSupport::TestCase
  setup do
    @prime_generator = PrimeGenerator.new
  end

  def test_generates_primes
    expected = [2, 3, 5, 7, 11]
    actual =  @prime_generator.up_to 12
    assert_equal expected, actual
  end

  def test_generates_primes_inclusively
    expected = [2, 3, 5, 7, 11, 13]
    actual =  @prime_generator.up_to 13
    assert_equal expected, actual
  end

  def test_generates_large_primes
    Timeout::timeout(max_time) { @prime_generator.up_to 100_000_000}
  rescue Timeout::Error
    assert false, message { "Prime generation exceeded max time of #{max_time} sec" }
  end
end
