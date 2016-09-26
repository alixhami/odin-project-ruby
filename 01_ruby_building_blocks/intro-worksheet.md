## Ruby Fundamentals

### *Numbers, Operators and Expressions:*
+ What's the difference between an `Integer` and a `Float`?
  + `Integer` - a whole number
  + `Float` - a number with decimals
+ Why should you be careful when converting back and forth between integers and floats?
  + Going back and forth between rounded and unrounded can skew the results. #sigfigs
+ What's the difference between `=`, `==`, and `===`?
  + `=` - variable assignment
  + `==` - equal to
  + `===` - generally used to determine if an object is included in a set (e.g., `7` is in `1..10`)
+ How do you do exponents in Ruby?
  + Use `**` (e.g., `2**2` => `4`)
+ What is a range?
  + A set of values with a beginning and end
+ How do you create a range?
  + With dots: `(1..3)` `('a'..'z')`
+ What's the difference between `(1..3)` and `(1...3)`?
  + `(1..3)` - 1 up to and including 3
  + `(1...3)` - 1 up to but not including 3
+ What are three ways to create a range?
  + Literals - `(0..2)` or `(0...3)`
  + Constructor - `Range.new(0,2)`

### *Strings:*
+ What's the difference between single and double quotes?
  + There isn't a difference, but you should use double quotes if you have a string with contractions or nested quotes in it
  + e.g., `"You don't want errors"`
  + e.g., `"Alix 'Juno' Hamilton"`
+ What is string interpolation?
  + Inserting code into a string
  + e.g., `"You can have #{400/15**2} salmon I guess"`
+ What are escape characters?
  + Escape characters tell Ruby to ignore the normal function of a character
  + e.g., `"I'm only 5'2\" tall"`
+ What are line breaks?
  + The point where a new line begins in text (`\n`)
+ How do you make other things into strings?
  + Convert using `.to_s`
  + e.g., `7.to_s` => `"7"`
+ How do you concatenate strings?
  + `"A string" + " another string" + " another string."`
+ How do you access a specific character or substring?
  + Specific character - `"Sandwiches"[0]`
  + Substring - `"Sandwiches"[0..3]`
+ How do you split up strings into arrays?
  + `"Ah I'm in pieces!".split(" ")` => `["Ah", "I'm", "in", "pieces!"]`
+ How are strings and arrays similar?
  + You can use brackets to show pieces
  + e.g., `"Stringy thingy"[0]` `["Stringy", "thingy"][0]`
+ How do you get and clean up user input on the command line?
  + `response = gets.chomp`
  + The `gets` asks the user for input, and the `chomp` removes the `\n` created when the user hit the enter key
+ What does it mean that strings are "mutable" and why care?
  + This means that strings can be updated (and object ID won't change)
  + e.g., `"Pizza" << " yum"`
+ What is a symbol?
  + A name and an internal ID; identified by a colon
  + `:id`
+ How is a symbol different from a string?
  + More efficient than strings - refers to the same object throughout the program
+ What is a Regular Expression (RegEx)?
  + A way to find specific characters within text
+ How can you center or right-justify a string?
  + `s = "Some text."`
  + `s.center(15)` => `"  Some text.   "`
  + `s.ljust(15)` => `"Some text.     "`
  + `s.rjust(15)` => `"     Some text."`

### *Arrays:*
+ What are three ways to create an array?
  + `sandwich = Array.new`
  + `sandwich = ["stuff","fun","meow"]`
  + `sandwich = Array.new(5, "bacon")` (array with 5 bacon values)
  + `(1..3).to_a`
+ How do you prepopulate the array with default data?
  + `sandwich = Array.new(5, "bacon")`
  + The first argument in the example above is the starting size, and the second argument is the default value.
+ How do you access items in an array?
  + `sandwich[0]` => `"bacon"`
+ How can you access a specific group of items in an array?
  + `sandwich[0..1]` returns the first two values
+ How do you modify the items in an array?
  + `sandwich[0] = "bread"`
+ How do you combine arrays?
  + `first_array + second_array` (this will append the second onto the first)
+ How do you find the values in one array that aren't in another?
  + `first_array - second_array` (returns values in first array that aren't in the second array)
+ How do you find values in both arrays?
  + `first_array & second_array` (returns only values found in both arrays)
+ What is the difference between `push`/`pop` and `shift`/`unshift`?
  + `push` - adds value to the end of the array
    + `sandwich.push("lettuce")`
  + `pop` - removes the last value from an array and returns it
    + `sandwich.pop`
  + `shift` - removes the first value from an array and returns it
    + `sandwich.shift`
  + `unshift` - adds a new item to the beginning of an array
    + `sandwich.unshift("lettuce")`
+ What is the shovel operator?
  + `<<` - equivalent to push
  + `sandwich << "lettuce"`
+ How is `> arr.pop` different from `> arr[-1]`?
  + Both return the last value, but `pop` actually removes it from the array
+ How is `push`ing or `<<`ing another array into your array different from just adding them together?
  + `push` and `<<` modify the existing array, rather than creating a new one
+ How do you delete items in an array?
  + `arr.delete_at(2)` - deletes at index 2
  + `arr.delete("bacon")` - deletes all of the bacon values
+ Why should you be careful deleting items in an array?
  + Deleting can't be reversed; it modifies the original array rather than creating a new one.
+ How can you convert arrays to strings?
  + `['bacon','eggs','sausage'].join(" ")`
+ How can you convert from other data types to arrays?
  + `(1..3).to_a`
  + `"bacon eggs sausage".split(" ")`
+ How can you figure out if an array contains a particular value?
  + `['bacon','eggs','sausage'].include?('bacon')`
+ How do you find the biggest item in an array?
  + `['bacon','eggs','sausage'].max`
+ How do you find the smallest item in an array?
  + `['bacon','eggs','sausage'].min`
+ How do you remove any duplicates from your array?
  + `['bacon','eggs','sausage','eggs'].uniq`
+ How do you find out how big an array is?
  + `['bacon','eggs','sausage'].length`
+ How do you put an array in order?
  + `['eggs','sausage','bacon'].sort`
+ What are the naming conventions for arrays?
  + Lower case, descriptive, with underscores
+ What should you store in arrays?
  + Numbers, letters, words

### *Hashes:*
+ What is a hash?
  + Also known as a dictionary
  + It's like an array, but you get to choose what the "index" is
+ What are keys and values?
  + Keys are unique identifiers for the values stored in the hash
  + Values don't have to be unique, and are assigned to keys
+ How is a hash similar to an Array?
  + You can access values using brackets (`sandwich[:meat]`)
+ How is a hash different from an Array?
  + They aren't stored in order
+ What are 3 ways to create a hash?
  + `sandwich = Hash.new`
  + `sandwich = {}`
  + `sandwich = Hash.new()`
  + `Hash["a" => 100, "b" => 200]`
  + `Hash[ [ ["a", 100], ["b", 200] ] ]`
  + `Hash["a", 100, "b", 200]`
+ What is the hash rocket?
  + `=>`
  + `Hash["a" => 100, "b" => 200]`
+ How do you access data in a hash?
  + `sandwich[:meat]`
+ How do you change data in a hash?
  + `sandwich[:meat] = 'bacon'`
+ What types of data are good to store in a hash?
  + Definitions, assignments, relationships
+ What are options hashes?
  + Using a hash as an argument for a method
  + If the hash is the last argument, you don't need curly brackets
  + `def sandwich bread, meat, options_hash`
  + `sandwich "GF sourdough", "bacon", vegetable: "lettuce", spread: "mayo"`
+ How do you delete data from a hash?
  + `sandwich.delete("bread")`
+ How do you add hashes together?
  + `sandwich.merge!(pizza)`
  + If there are duplicate keys, the second will override the first
+ How do you list out all the keys or values?
  + `puts sandwich.keys`
  + `puts sandwich.values`
+ How do you see if the hash contains a key or value?
  + `sandwich.has_value?("bacon")`
  + `sandwich.has_key?(:bread)`
+ What is a set?
  + A hash where all the values are either True or False
  + Search is faster than arrays

### *Dates and Times:*
+ How do you get the current date and time?
  + `Time.now`
+ How do you find just the Year? Month? Hour? Second? Weekday?
  + `Time.now.year`
  + `Time.now.month`
  + `Time.now.hour`
  + `Time.now.sec`
  + `Time.now.wday`
+ How do you create a `Time` specifically for 12/25/2013?
  + `Time.new(2013,12,25)`
+ How do you find how many days have passed between two `Time`s?
  + `(time1 - time2)/60/60/24`
+ What's the difference between UTC and GMT and Local times?
  + UTC = Coordinated Universal Time; used by computers around the world as the standard benchmark time
  + UTC is set at GMT, Greenwich Mean Time
  + Local time is whatever time your computer is set at
+ How would you find out the time that was 100 seconds ago? 10 days ago?
  + `Time.now - 100`
  + `Time.now - 10*24*60*60`

### *Other Random Stuff:*
+ What is `nil`?
  + Nothing! Null! None!
+ How do you check if something is `nil`?
  + `word.nil?`
+ What's the difference between `nil` and `blank` and `empty`?
  + `nil` - it's just nothing at all
  + `empty` - string/array/hash length is zero
  + `blank` - non-empty but contains only whitespace
+ Are the following `nil` or `empty`?
  + `" "` - `blank`
  + `""` - `empty`
  + `[]` - `empty`
  + `[""]` - `blank`
  + `{}` - `empty`
+ What's the difference between puts and p and print?
  + `puts` adds a newline after the output
  + `print` does not add a newline
  + `p` calls the `inspect` method on the object (will show quotes around string)
+ What does inspect do?
  + Returns a string containing a human-readable representation of obj
  + Shows more info, such as object ID, instance variables, values
+ What do `+=`, `-=`, `*=` and `/=` do?
  + Shortcuts for performing an operation relative to an object's value
  + Examples - `coins = 20`
  + `coins += 5` => 25
  + `coins -= 5` => 20
  + `coins *= 4` => 80
  + `coins /= 5` => 16
+ What is parallel assignment?
  + Assigning multiple variables at once
  + `sandwich, coins = "BLT", 20`
  + `sandwich` => `BLT`
  + `coins` => `20`
+ What's the easiest way to swap two variables?
  + `sandwich,pizza = pizza,sandwich`
