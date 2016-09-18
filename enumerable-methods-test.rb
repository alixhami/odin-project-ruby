#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'enumerable-methods'

# Tests are the examples from the Enumerable Ruby Docs

class EnumerableTest < Minitest::Test

  def test_my_each
    a = [ "a", "b", "c" ]
    result = ""
    a.my_each {|x| result << "#{x} -- " }
    assert_equal "a -- b -- c -- ", result
  end

  def test_my_each_with_index
    hash = Hash.new
    %w(cat dog wombat).my_each_with_index { |item, index| hash[item] = index}
    assert_equal hash, {"cat"=>0, "dog"=>1, "wombat"=>2}
  end

  def test_my_select
    result = [1,2,3,4,5].my_select { |num|  num.even?  }
    assert_equal [2,4], result
  end

  def test_my_all_with_true_block
    result = %w[ant bear cat].my_all? { |word| word.length >= 3 }
    assert_equal true, result
  end

  def test_my_all_with_false_block
    result = %w[ant bear cat].my_all? { |word| word.length >= 4 }
    assert_equal false, result
  end

  def test_my_all_without_block
    result = [nil, true, 99].my_all?
    assert_equal false, result
  end

  def test_my_any_with_true_block
    result = %w[ant bear cat].my_any? { |word| word.length >= 3 }
    assert_equal true, result
  end

  def test_my_any_with_false_block
    result = %w[ant bear cat].my_any? { |word| word.length >= 4 }
    assert_equal true, result
  end

  def test_my_any_without_block
    result = [nil, true, 99].my_any?
    assert_equal true, result
  end

  def test_my_none_with_true_block
    result = %w{ant bear cat}.my_none? { |word| word.length == 5 }
    assert_equal true, result
  end

  def test_my_none_with_false_block
    result = %w{ant bear cat}.my_none? { |word| word.length >= 4 }
    assert_equal false, result
  end

  def test_my_none_with_blank_input
    assert_equal true, [].my_none?
  end

  def test_my_none_with_nil_input
    assert_equal true, [nil].my_none?
  end

  def test_my_none_with_nil_false
    assert_equal true, [nil, false].my_none?
  end

  def test_my_none_with_true_input
    assert_equal false, [nil, false, true].my_none?
  end

  def test_my_count
    ary = [1, 2, 4, 2]
    assert_equal ary.my_count, 4
  end

  def test_my_count_with_arg
    ary = [1, 2, 4, 2]
    assert_equal ary.my_count(2), 2
  end

  def test_my_count_with_block
    ary = [1, 2, 4, 2]
    assert_equal ary.my_count{ |x| x%2==0 }, 3
  end

  def test_my_map_with_math_block
    result = (1..4).my_map { |i| i*i }
    assert_equal [1, 4, 9, 16], result
  end

  def test_my_map_with_string_block
    result = (1..4).my_map { "cat"  }
    assert_equal ["cat", "cat", "cat", "cat"], result
  end

  def test_my_map_with_proc
    proc = Proc.new { |i| i*i }
    result = (1..4).my_map(&proc)
    assert_equal [1, 4, 9, 16], result
  end

  def test_my_inject_with_sum_block
    result = (5..10).my_inject { |sum, n| sum + n }
    assert_equal 45, result
  end

  def test_my_inject_with_multiply_block
    result = (5..10).my_inject(1) { |product, n| product * n }
    assert_equal 151200, result
  end

  def test_my_inject_with_block
    longest = %w{ cat sheep bear }.my_inject do |memo, word|
      memo.length > word.length ? memo : word
    end
    assert_equal longest, "sheep"
  end

  def test_my_inject_with_multiply_els
    def multiply_els(nums)
      nums.my_inject(1) {|total, i| total * i}
    end
    assert_equal multiply_els([2,4,5]), 40
  end

end
