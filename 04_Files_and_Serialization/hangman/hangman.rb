require "yaml"

class Hangman
  attr_reader :scene, :user_progress, :remaining_guesses, :bad_guesses, :secret_word

  def initialize
    dictionary = File.open("dictionary.txt", "r")
    hangman_words = dictionary.read.split.select {|word| word.length.between?(5,12)}
    dictionary.close

    @hangman_scenes = File.open("hangman_scenes.txt").read.split("next\n")
    @secret_word = hangman_words.shuffle.pop.downcase
    @remaining_guesses = 6
    @hangman_index = 0
    @scene = @hangman_scenes[@hangman_index]
    @user_progress = Array.new(@secret_word.length,"_")
    @bad_guesses = []
  end

  def increment_scene
    @hangman_index += 1
    @scene = @hangman_scenes[@hangman_index]
  end

  def display
    puts @scene
    puts @user_progress.join(" ")
    puts "Bad guesses: #{@bad_guesses.join(", ")}" unless @bad_guesses.length == 0
  end

  def guess_letter(letter)
    if letter == 'save'
      save_game
    else
      (@secret_word.length).times do |i|
        @user_progress[i] = letter if letter == @secret_word[i]
      end

      unless @secret_word.include? letter
        @remaining_guesses -= 1
        increment_scene
        @bad_guesses << letter
      end
    end
  end

  def won?
    @user_progress.include?("_") ? false : true
  end

  def play
    display
    until @remaining_guesses == 0 || won?
      print "\nGuess a letter: "
      letter = gets.chomp.downcase
      guess_letter(letter)
      next if letter == 'save'

      display
      puts won? ? "YOU WIN!" : "Remaining guesses: #{@remaining_guesses}"
    end
  end

end

def get_valid_answer
  answer = gets.chomp
  until answer == 'y' || answer == 'n'
    puts "I didn't understand that. Please type 'y' or 'n'."
    answer = gets.chomp
  end
  answer
end

def save_game
  filename = 'saved.yaml'
  File.open(filename, 'w') do |file|
    file.puts YAML.dump(self)
  end
  puts "Game saved! Would you like to keep playing? (y/n)"
  answer = get_valid_answer
  if answer == 'n'
    puts "See ya next time!"
    exit
  end
end

def load_game
  content = File.open('saved.yaml', 'r')
  YAML.load(content.read)
end

# Game play
puts "\nWelcome to Hangman!"
puts "Would you like to load a previously saved game? (y/n)"
answer = get_valid_answer
game = answer == 'y' ? load_game : Hangman.new
puts "Alrighty, let's play! Type 'save' at any time to save your game."

game.play
puts "\nYOU LOSE. IT WAS #{game.secret_word.upcase}" unless game.won?
