require "minitest/autorun"
require_relative "isbn.rb"

class TestIsbn < Minitest::Test

	def test_if_working
		assert_equal(1, 1)
	end

	def test_if_isbn10_is_valid_if_10_digit
		assert_equal(true, valid_isbn_10("0471958697"))
	end

end