class Grid
  attr_accessor :board

  def initialize
  	@board = Array.new(9,"-")
    @possible_moves = (1..9).to_a
  end

  def show_board
  	puts "_"*12
  	index = 0
  	3.times do
  	  print "|"
  	  3.times do
  	  	print " #{@board[index]} |"
  	  	index += 1
  	  end
    	puts "\n|___|___|___|"
    end
  end

  def make_move(move_cell,letter)
    valid_move = false
    until valid_move
      if @possible_moves.include?(move_cell.to_i)
    	  @board[move_cell.to_i-1] = letter
        @possible_moves.delete(move_cell.to_i)
        valid_move = true
      elsif (1..9) === move_cell.to_i
        puts "That space is already taken! Try again."
        move_cell = gets.chomp
        valid_move = false
      else
    	  puts "Not a valid move. Try again."
        move_cell = gets.chomp
        valid_move = false
      end
    end
  end

  def winner?(letter)
  	@board[0..2].all? {|i| i == letter} ||
  	@board[3..5].all? {|i| i == letter} ||
  	@board[6..8].all? {|i| i == letter} ||
  	[@board[0],@board[3],@board[6]].all? {|i| i == letter} ||
  	[@board[1],@board[4],@board[7]].all? {|i| i == letter} ||
  	[@board[2],@board[5],@board[8]].all? {|i| i == letter} ||
  	[@board[0],@board[4],@board[8]].all? {|i| i == letter} ||
  	[@board[2],@board[4],@board[6]].all? {|i| i == letter}
  end

  def draw?
  	@board.none? {|i| i == "-"}
  end

end

puts "Welcome to Tic Tac Toe!"
game = Grid.new
player_1 = [1, "X"]
player_2 = [2, "O"]
current_player = player_1
game_over = false

until game_over do
  puts "Player #{current_player[0]}, pick a number between 1 and 9"
  move = gets.chomp.to_i
  game.make_move(move,current_player[1])
  game.show_board
  if game.winner?(current_player[1])
    puts "PLAYER #{current_player[0]} WINS!"
    game_over = true
  elsif game.draw?
    puts "Aw, schucks! It's a draw. Better luck next time."
    game_over = true
  end

  if current_player == player_1
    current_player = player_2
  else
    current_player = player_1
  end
end
