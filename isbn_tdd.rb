require "minitest/autorun"
require_relative "isbn.rb"

class TestIsbn < Minitest::Test

	def test_if_working
		assert_equal(1, 1)
	end

	def test_if_isbn10_is_valid_if_10_digit
		assert_equal(true, isbn_check("0321146530"))
	end

	def test_if_isbn10_is_invalid_if_not_10_digit
		assert_equal(false, isbn_check("abcd"))
	end

	def test_if_isbn10_is_valid_with_space_and_dashes
		assert_equal(true, isbn_check("0321-146530"))
	end

	def test_if_isbn10_is_invalid_if_has_chars
		assert_equal(false, isbn_check("0431958a97"))
	end

	def test_if_checkdigit_is_true
		assert_equal(true, isbn_check("877195869x"))
	end

	def test_if_isbn13_is_valid
		assert_equal(true, isbn_check("9780470059029"))
	end

	def test_if_isbn13_is_invalid
		assert_equal(false, isbn_check("97804a0059029"))
	end

	def test_if_spaces_are_accounted_for_in_isbn_13
		assert_equal(true, isbn_check("978-0-13-149505-0"))
		assert_equal(true, isbn_check("978 0 471 48648 0"))
	end
end