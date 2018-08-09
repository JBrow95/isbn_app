def valid_isbn_10(isbn)
	isbn_arr = isbn.split("")
	isbn_arr.delete_if {|n| n==' ' || n=='-'}
	p "#{isbn_arr}"
	if isbn_arr.length == 10
		true
	else
		false
	end
end