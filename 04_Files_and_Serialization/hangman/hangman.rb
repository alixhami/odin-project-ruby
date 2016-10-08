class Hangman
  attr_reader :scene, :user_progress, :remaining_guesses, :bad_guesses, :secret_word

  def initialize
    dictionary = File.open("dictionary.txt")
    @@hangman_words = []
    dictionary.read.split("\n").each do |i|
      word = i.strip
      @@hangman_words << word if (5..12) === word.length
    end
    dictionary.close

    @@hangman_scenes = File.open("hangman_scenes.txt").read.split("next\n")
    @secret_word = @@hangman_words.shuffle.pop.downcase
    @remaining_guesses = 6
    @hangman_index = 0
    @scene = @@hangman_scenes[@hangman_index]
    @user_progress = Array.new(@secret_word.length,"_")
    @bad_guesses = []
  end

  def increment_scene
    @hangman_index += 1
    @scene = @@hangman_scenes[@hangman_index]
  end

  def guess_letter(letter)
    (@secret_word.length).times do |i|
      @user_progress[i] = letter if letter == @secret_word[i]
    end

    unless @secret_word.include? letter
      @remaining_guesses -= 1
      increment_scene
      @bad_guesses << letter
    end
  end

  def won?
    @user_progress.include?("_") ? false : true
  end
end

game = Hangman.new
puts game.scene
until game.remaining_guesses == 0 || game.won?
  puts "Guess a letter: "
  letter = gets.chomp.downcase
  game.guess_letter(letter)

  puts game.scene
  puts game.user_progress.join(" ")
  puts "Bad guesses: #{game.bad_guesses.join(", ")}"
  puts game.won? ? "YOU WIN!" : "Remaining guesses: #{game.remaining_guesses}"
end

unless game.won?
  puts "YOU LOSE. IT WAS #{game.secret_word.upcase}"
end
