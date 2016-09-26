## Advanced Building Blocks

### *Conditionals and Flow Control*
+ What is a "boolean"?
  + `true` or `false` value
+ What are "truthy" values?
  + Non-boolean value that counts as true
  + Everything except `nil` is truthy
+ Are `nil`, `0`, `"0"`, `""`, `1`, `[]`, `{}` and `-1` considered true or false?
  + `nil` - falsey
  + `0` - truthy
  + `"0"` - truthy
  + `""` - truthy
  + `1` - truthy
  + `[]` - truthy
  + `{}` - truthy
  + `-1` - truthy
+ When do you use `elsif`?
  + When you have multiple conditions to check
+ When do you use `unless`?
  + When you want to say "if not"
+ What does `<=>` do?
  + Gives three different outputs depending on if the left side is less than, greater than, or equal to the right side
  + `1 <=> 100` => -1
  + `1 <=> 1` => 0
  + `1 <=> -1000` => 1
+ Why might you define your own `<=>` method?
  + It can be used to sort
  + `list.sort { |a, b| b <=> a }` - reverse alphabetical
+ What do `||` and `&&` and `!` do?
  + `||` - OR
  + `&&` - AND
  + `!` - NOT
+ What is returned by `puts("woah") || true`?
  + `woah` => true
+ What is `||=`?
  + Sets a value to a variable if it isn't already set
+ What is the ternary operator?
  + Shorthand for `if` statements
  + `condition ? do_this_if_true : do_this_if_false`
+ When should you use a `case` statement?
  + When you want to run different code based on the value of a variable

### *Iteration*
+ What does `loop` do?
  + Goes through a series of procedures until a condition is met
+ What are the two ways to denote a block of code?
  + `do` and `end`
  + `{}`
+ What is an index variable?
  + A variable you define to keep track of which iteration you are on
+ How do you print out each item of a simple array `[1,3,5,7]` with:
  + `numbers = [1,3,5,7]`
  + `loop`?
    ```ruby
    i = 0
    loop {puts numbers[i]; i+=1; break if i == numbers.length}
    ```
  + `while`?
    ```ruby
    while i < numbers.length
	  puts numbers[i]
	  i+=1
    end
    ```
  + `for`?
    ```ruby
    for i in 0..3
	  puts numbers[i]
	  i+=1
    end
    ```
  + `#each`?
    ```ruby
    numbers.each {|i| puts i}
    ```
  + `#times`?
    ```ruby
    numbers.length.times {|i| puts numbers[i]}
    ```
+ What's the difference between `while` and `until`?
  + `while` repeats code as long as a condition is true
  + `until` repeats code until it is false
+ How do you stop a loop?
  + Choose a loop that will end naturally (e.g., `5.times`) or use `break` to exit once a condition is met
+ How do you skip to the next iteration of a loop?
  + `next`
+ How would you start the loop over again?
  + `redo`
+ What are the (basic) differences between situations when you would use `while` vs `#times` vs `#each`?
  + Use `while` when the loop has to run an indeterminable number of times
  + Use `#times` when code needs to be executed a specific number of times
  + Use `#each` when an action needs to be performed on an array or hash
+ What does nesting loops mean and when would you use it?
  + Nesting loops means you have a loop inside a loop. This is useful when you have to something two-dimensional, like searching through arrays within arrays. (e.g., split each word into letters and then do something to each letter)

### *Blocks, Procs, and Lambdas:*
+ How is a block like a function?
  + Chunks of code that you can drop into another method as an input
+ How is a block different from a function?
  + Cannot be independent from a method
+ What are the two ways to declare a block?
  + `{}`
  + `do ... end`
+ How do you return data from a block?
  + Use implicit return (the last line)
+ What happens if you include a `return` statement in a block?
  + It will exit the method calling the block too (bad)
+ Why would you use a block instead of just creating a method?
  + Blocks allow you to create more complicated inputs to a method
+ What does `yield` do?
  + Prompts the method to receive input from a block
+ How do you pass arguments to a block from within a method?
  + `yield(args)`
+ How do you check whether a block was actually passed in?
  + `#block_given?` or `yield if block_given?`
+ What is a proc?
  + Procedures
  + The class name for a block
  + Can be saved to a variable
  + Uses `#call` instead of `yield`
  + Use a proc by prepending with `&`
+ What's the difference between a proc and a block?
  + You can save Procs to a variable, so you can reuse them and use multiple in one method
+ When would you use a proc instead of a block?
  + Use if you want to use multiple blocks or use a block more than once
+ What is a closure?
  + A chunk of code you can pass around but which hangs onto the variables that you gave it when you first called it
+ What is a lambda?
  + Another type of closure that is even closer to a method than a proc
+ What's different between a lambda and a proc?
  + Can use the explicit `return`
  + Strict about getting the right number of arguments
+ What is a Method (capital "M")?
  + A type of closure that is the closest to a method
+ What do Methods basically allow you to do that could probably be pretty interesting when you're writing some more advanced programs later on?
  + Pass into a normal method by passing the symbol of its name in the word `method()`

### *Enumerable and Modules*
+ What is a module?
  + A collection of methods
+ Why are modules useful?
  + You can use the same methods in many different classes without rewriting all the code
+ What does `#each` do?
  + Goes through each item in the object and passes it to the block specified
+ What does `#each` return?
  + Returns the original collection of items
+ What does `#map` do?
  + Runs the block and gives back an object filled with whatever your block returned each time
  + Same as `#collect`
+ What does `#map` return?
  + The new object created in the block
+ What is the difference between `#map` and `#collect`?
  + The name
  + More conventional to use `#map`
+ What does `#select` do?
  + Runs the block on every item of the object and returns only those that return `true`
+ What does `#select` return?
  + Returns object of items that return true
+ What is the difference between `#each` `#map` and `#select`?
  + `#each` returns original object
  + `#map` returns new object
  + `#select` returns only certain items from the original
+ What does `#inject` do?
  + Passes not just the element, but whatever was returned by the previous iteration into the block
  + Think of it as using an "accumulator" and an "accelerator"
+ When might you use `#inject`?
  + To keep a running total or build a hash
  + `my_array.inject(0){|running_total, item| running_total + item }`
+ How do you check if every item in a hash fulfills a certain criteria?
  + `sandwich.any? { |ingredient| ingredient.length >= 3 }`
+ What about if none of the elements fulfill that criteria?
  + `sandwich.none? { |ingredient| ingredient.length >= 4 }`
+ What (basically) is an enumerator?
  + A class which allows both internal and external iteration

### *Writing Methods*
+ How many things should a method ideally do?
  + Each method should only do ONE thing
+ What types of things should a method modify?
  + Only use variables that have been passed in - not global variables
  + Don't destructively modify the arguments or object the method was called on unless it is explicitly a bang! method
+ What should you name a method?
  + Descriptive but short
  + Based on what it will return or what the major intended effect will be
  + End with `?` if it will return true/false
+ What does `self` mean?
  + Whatever object the current method was called on
+ What do you need to do to create your own Ruby script file?
  + Create a file with the extension `.rb`
+ How would you run a Ruby script from the command line?
  + `$ ruby filename.rb`
+ How can you check whether your script was being run from the command line?
  + `$0` is the current file and `__FILE__` is the filename, so you can check if the two are equal
  ```ruby
  if $0 == __FILE__
  puts "I'm a command line script now!"
  else
  puts "Someone else is running me (I feel so violated...)"
  end
  ```
+ What is a shebang line?
  + `#!/usr/bin/ruby`
  + Points to ruby executable (tells computer where compiler is)
+ What does `require` do?
  + Can bring in gems downloaded from the internet (by name) or specific files on your computer (by filepath)
  + Only loads the file once
+ What does `load` do?
  + Brings the file in every time it is called
+ What is the difference between `require` and `load`?
  + `require` will return false if you try to load the same library twice
  + You don't need to specify the file extension with `require`, but you do for `load`
+ How do you access any parameters that were passed to your script file from the command line?
  + `ARGV`
+ What does `#send` do?
  + Lets you send an object to a method
+ When would `#send` be used that's different from just running the method on an object 'normally'?
  + Ruby lets you define new methods in runtime and this lets you call them dynamically since the method name is no longer hardcoded
