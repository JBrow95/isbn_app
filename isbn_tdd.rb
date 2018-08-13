require "minitest/autorun"
require_relative "isbn.rb"

class TestIsbn < Minitest::Test

	def test_if_working
		assert_equal(1, 1)
	end

	def test_if_isbn10_is_valid_if_10_digit
		assert_equal(true, isbn_check("04319 58697"))
	end

	def test_if_isbn10_is_invalid_if_not_10_digit
		assert_equal(false, isbn_check("12345"))
	end

	def test_if_isbn10_is_valid_with_space_and_dashes
		assert_equal(true, isbn_check("0431 958697"))
	end

	def test_if_isbn10_is_invalid_if_has_chars
		assert_equal(false, isbn_10("0431958a97"))
	end

	def test_if_checkdigit_is_true
		assert_equal(true, isbn_10("877195869x"))
	end

	def test_if_isbn13_is_valid_if_13_digit
		assert_equal(true, isbn_check("9780470059029"))
	end
	
	def test_if_spaces_are_accounted_for_in_isbn_13
		assert_equal(true, isbn_check("978-0-13-149505-0"))
	end
end