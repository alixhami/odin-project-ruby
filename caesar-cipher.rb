def caesar_cipher(string, shift_factor)
	alphabet = ("a".."z").to_a
	encrypted_string = ""
	(string.length).times do |i|

		if alphabet.index(string[i].downcase).nil? # handles non-letters
			encrypted_string += string[i]
			next
		else
			letter_index = alphabet.index(string[i].downcase).to_i
      shifted_index = ((letter_index + shift_factor) % 25)
			shifted_index -= 1 if letter_index + shift_factor > 25
		end

		if string[i].upcase == string[i]
			encrypted_string += alphabet[shifted_index].upcase
		else
			encrypted_string += alphabet[shifted_index]
		end

	end
	encrypted_string
end
