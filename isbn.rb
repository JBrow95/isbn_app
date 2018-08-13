def isbn_check(isbn)
	if isbn == nil
		isbn = false
	else
		isbn_arr = isbn.split("")
		isbn_arr.delete_if {|c| c==' ' || c=='-'}
	end

	case isbn_arr.length

	when 10 || 13
		return true
	when 9
		isbn_10(isbn_arr)
	else
		return false
	end
	isbn_arr
end

def isbn_10(isbn_arr)
	the_arr = isbn_arr.split("")

	isbn_checksum = 0

	isbn_checkdigit = the_arr.pop
	if isbn_checkdigit.downcase == "x"
		isbn_checkdigit = 10
	else
		isbn_checkdigit = isbn_checkdigit.to_s
	end

	the_arr.each_with_index do |d, idx|
		unless d.to_i.to_s == d
			return false
		end
		isbn_checksum += d.to_i * (idx+1)
	end

	if isbn_checksum % 11 == isbn_checkdigit
		return true
	end
end