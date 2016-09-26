class Mastermind
  attr_accessor :code

  def initialize
  	@code = []
  end

  @@possible_colors = ["red", "green", "blue", "yellow", "black", "white"]

  def new_code
  	4.times {|i| @code[i] = @@possible_colors.shuffle.first}
  end

  def test_guess(guess)
  	feedback = []
  	4.times do |i|
  	  if @code[i] == guess[i]
  	  	feedback << "black"
  	  elsif @code.include? guess[i]
  	  	feedback << "white"
  	  end
  	end
  	feedback
  end

  def play_as_breaker
    12.times do |i|
      print "\nGuess ##{i+1}: "
      guess = gets.chomp.split(" ")
      feedback = test_guess(guess)
      if feedback == ["black", "black", "black", "black"]
  	    puts "\nCONGRATULATIONS! You've cracked the code!"
  	    break
      else
  	    puts "Feedback: #{feedback}"
      end
      puts "\nYou're out of guesses. Defeated by a MACHINE!" if i == 11
    end
  end

  def computer_play_as_breaker
  	answer = {}
  	puts " "
  	12.times do |i|
      computer_guess = []
      if (0..5) === i
      	4.times {|j| computer_guess << @@possible_colors[i]}
      	feedback = test_guess(computer_guess)
      	feedback.each_with_index do |item,index|
          answer[index+1] = @@possible_colors[i] if item == "black"
        end
      else
      	computer_guess = [answer[1], answer[2], answer[3], answer[4]]
        feedback = test_guess(computer_guess)
      end

      if feedback == ["black", "black", "black", "black"]
      	puts "\nYour code is: #{computer_guess.join(" ")}!"
  	    puts "\nThe computer cracked your code in just #{i+1} guesses! \nDefeated by a MACHINE!"
  	    break
      else
  	    puts "Guessing..."
      end

      puts "\nCONGRATULATIONS! You have triumphed over the machine!" if i == 11
    end
  end

  def play_as_maker
    puts "\nWhat would you like the code to be?"
    @code = gets.chomp.split(" ")
    computer_play_as_breaker
  end

end

puts "Welcome to MASTERMIND"
puts "\nIn this game, a code maker will devise a code of four colors. The possible colors are red, green, blue, yellow, black, and white. A code breaker will then have 12 guesses to crack the code. Codes should be formatted as four colors separated by spaces, like this: 'yellow green blue black'. Note that colors may be repeated. The code breaker will receive feedback for each guess. If the code breaker chooses a color in the right spot, they will receive the feedback of 'black'. If the code breaker chooses the right color in the wrong spot, they will get the feedback of 'white'."
game = Mastermind.new
game.new_code
puts "\nWould you like to be the code 'maker' or 'breaker'?"
player = gets.chomp
loop do
  if player == "breaker"
    game.play_as_breaker
  	break
  elsif player == "maker"
  	game.play_as_maker
	break
  elsif player == "quit"
	break
  else
    puts "I'm sorry, I didn't understand that response. Please type 'maker' or 'breaker'. Otherwise, type 'quit' to exit the game."
  	player = gets.chomp
  end
end
