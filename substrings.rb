# Implement a method #substrings that takes a word as the first argument and
# then an array of valid substrings (your dictionary) as the second argument.
# It should return a hash listing each substring (case insensitive) that was
# found in the original string and how many times it was found.

def substrings(string,dictionary)
	word_count = Hash[dictionary.map {|i| [i, 0]}]
	words = string.downcase.split(" ")

	words.each do |word|
		word_count.each do |key,value|
			word_count[key] += 1 if word.include?(key)
		end
	end

	word_count.delete_if {|key, value| value == 0 }
	word_count
end

# Tests - Success if True prints twice
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("below",dictionary) == {"below"=>1, "low"=>1}

puts substrings("Howdy partner, sit down! How's it going?", dictionary) == {"down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, "it"=>2, "i"=> 3, "own"=>1,"part"=>1,"partner"=>1,"sit"=>1}
