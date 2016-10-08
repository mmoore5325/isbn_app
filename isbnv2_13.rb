def valid_isbn_13?(isbn)
	remove_spaces(isbn)
	remove_dashes(isbn)

	isbn.length == 13 ? true : false
end

def remove_spaces(isbn)
	isbn.gsub!(" ", "")
end

def remove_dashes(isbn)
	isbn.gsub!("-", "")
end

def validate_isbn_13?(isbn)

	isbn = isbn.to_s.chars.map(&:to_i)

	checkdigit = isbn.last

	isbn.pop

	sum = 0

	isbn.each_with_index do |value, index|
		if index % 2 == 0
			value = value
		else
			value = 3 * value
		end
		sum += value
	end

	checkdigit2 = 10 - (sum % 10)

	checkdigit == checkdigit2 ? true : false

end

# def validate_isbn_13?(isbn)

# 	valid_isbn_13?(isbn)

# 	isbn = isbn.to_s.chars.map(&:to_i)

# 	checkdigit = isbn.last

# 	isbn.pop

# 	sum = 0

# 	isbn.each_with_index do |value, index|
# 		if index % 2 == 0
# 			value = value
# 		else
# 			value = 3 * value
# 		end
# 		sum += value
# 	end

# 	checkdigit2 = 10 - (sum % 10)

# 	checkdigit == checkdigit2 ? true : false
# end





