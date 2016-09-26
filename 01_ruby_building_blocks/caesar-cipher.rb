# In cryptography, a Caesar cipher, also known as Caesar's cipher, the shift
# cipher, Caesar's code or Caesar shift, is one of the simplest and most widely
# known encryption techniques. It is a type of substitution cipher in which each
# letter in the plaintext is replaced by a letter some fixed number of positions
# down the alphabet. For example, with a left shift of 3, D would be replaced by
# A, E would become B, and so on. The method is named after Julius Caesar, who
# used it in his private correspondence.

# Implement a caesar cipher that takes in a string and the shift factor and then
# outputs the modified string.

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

# Test - Success if console prints true
puts caesar_cipher("What a string!", 5) == "Bmfy f xywnsl!"
