def valid_isbn_10?(isbn)
	remove_spaces(isbn)
	remove_dashes(isbn)

	isbn.length == 10 ? true : false #same as if else statement
end

def remove_spaces(isbn)
	isbn.gsub!(" ", "")
end

def remove_dashes(isbn)
	isbn.gsub!("-", "")
end

def validate_isbn_10?(isbn)

	valid_isbn_10?(isbn)
	
	isbn = isbn.to_s.chars.map(&:to_s)	#turns in

	checkdigit = isbn.last			#Creating a variable for the last element, the check digit, to test against at the end in order to validate the ISBN.
	if checkdigit == "x" || checkdigit == "X"	#if the check digit is x or X...
		checkdigit = 10							#...it turns into integer 10
	else
		checkdigit = checkdigit.to_s.chars.map(&:to_s)		#Changes the checkdigit "x" to ["x"]
		checkdigit = checkdigit.map {|i| i.gsub(/[^\d]/, '')}  #checks array for non-numeric characters and removes them, turning ["x"] into [""]
		checkdigit.each_with_index do |value, index|	
			if value == ""								#this each_with_index deletes the checkdigit if it is [""], otherwise, when converted, it would convert to 0.
				checkdigit.delete_at(index)
			end
		end
		checkdigit = checkdigit.map(&:to_i) #converts to 
		checkdigit = checkdigit.join
		checkdigit = checkdigit.to_i
	end
	isbn.pop	#removes the last element, which should be the checkdigit

	isbn = isbn.map {|i| i.gsub(/[^\d]/, '')}  #deletes any non-numerical characters from the isbn calculation, turns element into [""]

	isbn.each_with_index do |value, index|	
		if value == ""						#deletes empty elements
			checkdigit.delete_at(index)
		end
	end

	isbn = isbn.map(&:to_i)	#turns the isbn string array["1", "2", "3"] into an integer array[1, 2, 3]

	sum = 0
	isbn.each_with_index do |value, index|	
		sum += (index + 1) * value			#multiplies each number by the index + 1
	end
	
	checkdigit2 = sum % 11		# solves for the calculated check digit based off the first 9 numbers given
	checkdigit == checkdigit2 ? true : false	#if the original checkdigit above is equal to this calculated checkdigit, then it is true, else, false

end

# isbn = ["1", "2", "x", "!", "%", "7", "g", "`", "~"]