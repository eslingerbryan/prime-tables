require "test_helper"

class MultiplicationTableGeneratorTest < ActiveSupport::TestCase
  setup do
    @multiplication_table_generator = MultiplicationTableGenerator.new
  end

  def test_generates_multiplication_table
    expected = [
      [nil, 1, 2, 3],
      [1, 1, 2, 3],
      [2, 2, 4, 6],
      [3, 3, 6, 9]

    ]
    actual =  @multiplication_table_generator.for [1, 2, 3]
    assert_equal expected, actual
  end
end
