def isbn_check(isbn)
	if isbn == nil
		isbn = "invalid"
	end

	if isbn == "Valid"
		"valid"
	end
	
	isbn_arr = isbn.split("")
	isbn_arr.delete_if {|c| c ==" " || c =="-"}
	case isbn_arr.length

	when 10
		isbn_10(isbn_arr)
	when 13
		isbn_13(isbn_arr)
	else
		isbn_arr = "Invalid"
	end
end

def isbn_10(isbn_arr)
	the_arr = isbn_arr

	isbn_checksum = 0

	isbn_checkdigit = the_arr.pop
	if isbn_checkdigit.downcase == "x"
		isbn_checkdigit = 10
	else
		isbn_checkdigit = isbn_checkdigit.to_i
	end

	the_arr.each_with_index do |d, idx|
		unless d.to_i.to_s == d
			return false	
		end
		isbn_checksum += d.to_i * (idx+1)
	end

	if isbn_checksum % 11 == isbn_checkdigit
		isbn_arr = "Valid"
	else
		isbn_arr = "Invalid"
	end
end

def isbn_13(isbn_arr)
	the_arr = isbn_arr

	isbn_checksum = 0

	isbn_checkdigit = the_arr.pop
	if isbn_checkdigit.downcase == "x"
		isbn_checkdigit = 10
	else
		isbn_checkdigit = isbn_checkdigit.to_i
	end

	the_arr.each_with_index do |d, idx|
		unless d.to_i.to_s == d
			return false	
		end
		if (idx+1).even?
			isbn_checksum += d.to_i * 3
		else
			isbn_checksum += d.to_i * 1
		end
	end

    sum = (10 - (isbn_checksum % 10)) % 10
	if sum == isbn_checkdigit
		isbn_arr = "Valid"
	else
		isbn_arr = "Invalid"
	end
end