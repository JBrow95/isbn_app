require "minitest/autorun"
require_relative "isbn.rb"

class TestIsbn < Minitest::Test

	def test_if_working
		assert_equal(1, 1)
	end

	def test_if_isbn10_is_valid_if_10_digit
		assert_equal(true, valid_isbn_10("0431958697"))
	end

	def test_if_isbn10_is_invalid_if_not_10_digit
		assert_equal(false, valid_isbn_10("12345"))
	end

	def test_if_isbn10_is_valid_with_space_and_dashes
		assert_equal(true, valid_isbn_10("0431 958697"))
	end
end