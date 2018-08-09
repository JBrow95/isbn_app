def valid_isbn_10(isbn)
	isbn_arr = isbn.split("")
	isbn_arr.delete_if {|n| n==' ' || n=='-'}

	isbn_checksum = 0

	if isbn_arr.length == 10
		true
	else
		false
	end

	# isbn_checkdigit = isbn_arr.pop
end