require 'minitest/autorun'
require './day1'

class TestDay1 < MiniTest::Unit::TestCase
  def setup
    @file_path = "/tmp/test.txt"
    write_file([1,2,3])
  end

  def write_file(data)
    File.write(@file_path, data.join("\n"), mode: "w")
  end

  def teardown
    File.delete(@file_path)
  end

  def test_counts_increases
    counter = IncreaseCounter.new(@file_path)
    assert_equal 2, counter.increases
  end

  def test_part_1_example
    example_data = [
      199,
      200,
      208,
      210,
      200,
      207,
      240,
      269,
      260,
      263
    ]
    write_file(example_data)
    counter = IncreaseCounter.new(@file_path)
    assert_equal 7, counter.increases
  end

  def test_part_2_example
    example_data = [
      199,
      200,
      208,
      210,
      200,
      207,
      240,
      269,
      260,
      263
    ]
    write_file(example_data)
    counter = IncreaseCounter.new(@file_path)
    assert_equal 5, counter.window_increases
  end

  def test_with_full_advent_data_set
    counter = IncreaseCounter.new("./day_1_data.txt")
    assert_equal 1557, counter.increases
    assert_equal 1608, counter.window_increases
  end

end
