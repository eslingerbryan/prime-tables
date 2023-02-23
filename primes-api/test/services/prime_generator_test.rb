require "test_helper"


class PrimeGeneratorTest < ActiveSupport::TestCase
  setup do
    @prime_generator = PrimeGenerator.new
  end

  def test_generate_primes
    [
      { n: 5, expected: [2, 3, 5, 7, 11] },
      { n: 3, expected: [2, 3, 5] },
      { n: 7, expected: [2, 3, 5, 7, 11, 13, 17] }
    ].each { |test_case| assert_equal test_case[:expected], @prime_generator.generate(test_case[:n]) }
  end

  def test_generate_large_primes
    Timeout::timeout(max_time) do 
      assert_equal 15_485_863, @prime_generator.generate(1_000_000).last
    end
  rescue Timeout::Error
    assert false, message { "Prime generation exceeded max time of #{max_time} sec" }
  end

  def test_sieve
    expected = [2, 3, 5, 7, 11]
    actual =  @prime_generator.up_to 12
    assert_equal expected, actual
  end

  def test_sieve_is_inclusive
    expected = [2, 3, 5, 7, 11, 13]
    actual =  @prime_generator.up_to 13
    assert_equal expected, actual
  end

  def test_sieve_large_primes
    Timeout::timeout(max_time) { @prime_generator.up_to 100_000_000}
  rescue Timeout::Error
    assert false, message { "Prime generation exceeded max time of #{max_time} sec" }
  end
end
