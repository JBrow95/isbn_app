require "minitest/autorun"
require_relative "isbn.rb"

class TestIsbn < Minitest::Test

	def test_if_working
		assert_equal(1, 1)
	end

	def test_if_class_is_arr
		assert_equal(Array, valid().class)
	end
end