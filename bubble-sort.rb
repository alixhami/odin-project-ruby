# 1 - Build a method #bubble_sort that takes an array and returns a sorted array.
# It must use the bubble sort methodology (using #sort would be pretty pointless,
# wouldn't it?).

# 2 - Now create a similar method called #bubble_sort_by which sorts an array but
# accepts a block. The block should take two arguments which represent the two
# elements currently being compared. Expect that the block's return will be
# similar to the spaceship operator you learned about before -- if the result of
# the block is negative, the element on the left is "smaller" than the element
# on the right. 0 means they are equal. A positive result means the left element
# is greater. Use this to sort your array.

def bubble_sort(numbers)
	loop do

	  swapped = false

	  (numbers.length-1).times do |i|
	  	if numbers[i] > numbers[i+1]
	  	  numbers[i], numbers[i+1] = numbers[i+1], numbers[i]
	  	  swapped = true
	  	else
	  	  next
	  	end
	  end

	  break if not swapped

  end
  numbers
end

if $PROGRAM_NAME == __FILE__
  p bubble_sort([4,3,78,2,0,2])
end


def bubble_sort_by(items)

	loop do
		swapped = false

		(items.length-1).times do |i|
	  	if yield(items[i],items[i+1]) > 1
			  items[i], items[i+1] = items[i+1], items[i]
	  	  swapped = true
	  	else
	  	  next
	  	end
		end

		break if not swapped
	end
	items
end

if $PROGRAM_NAME == __FILE__
  p bubble_sort_by(["welcome","hi","hello","hey"]) {|left,right| left.length - right.length}
end
