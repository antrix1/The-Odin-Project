require 'yaml'

class Game

  #Constructor where all variables I'll be using are initialized
  def initialize
    @word_array = File.open('5desk.txt').readlines.map{|w| w.strip}.select{|w| w.length >= 5 && w.length < 12}.to_a
    @word_to_guess = @word_array[rand(@word_array.length)].upcase
    @char_array = @word_to_guess.split("")
    @wrong_guesses = 0
    @used_letters = []
    @display_word = ""
    @word_to_guess.length.times {@display_word += "_"}

    puts "Hello there, let's play a game!\nThe numbers beneath the lines indicate the position of the letter you are guessing. It also shows you how long the word is!"
    puts "Type load to load your saved game or play to start a new one."
    input = gets.chomp.upcase
    if input == 'LOAD'
      load_game
    else
      start_game
    end
  end

  # A method that starts the game and calls other methods with input from the user
  def start_game
    puts @display_word
    1.upto(@display_word.length) {|x| print x}
    while true
      print "\n"
      puts "Enter a letter or write 'save' to save the game"
      input = gets.chomp.upcase
      if input == 'SAVE'
        puts save_game
        exit(0)
      else
        make_a_guess(input)
        @used_letters.push(input)
        puts @display_word
        1.upto(@display_word.length) {|x| print x}
        show_hangman(@wrong_guesses)
        check_win
      end
    end
  end

  # A method that checks if the user input is contained in the @word_to_guess and if user input was already used
  def validate_input(input)
    if @char_array.to_a.include?(input) && !@used_letters.include?(input)
      1
    elsif !@char_array.to_a.include?(input) && !@used_letters.include?(input)
      2
    elsif @used_letters.include?(input)
      3
    end
  end

  # A method which handles user input and replaces empty lines with a letter if it matches
  def make_a_guess(input)
    if validate_input(input) == 1
      @char_array.each_with_index do |c, i|
        if input == c
          @display_word[i] = "#{input}"
        end
      end
    elsif validate_input(input) == 2
      @wrong_guesses +=1
    elsif validate_input(input) == 3
      puts "You already used that letter. Try again!"
    end
  end

  # A method to check win conditions
  def check_win
    if @wrong_guesses >= 6
      puts "You lose!"
      exit(0)
    elsif @word_to_guess == @display_word
      puts "You win!"
      exit(0)
    end
  end

  # A method that saves important variables into the yaml file
  def save_game
    yaml_data = [@display_word, @word_to_guess, @wrong_guesses, @used_letters, @char_array]
    f = File.open('saved_game.yaml', 'w+')
    f.puts YAML::dump(yaml_data)
  end

  # A method that loads the yaml file and overrides important variables
  def load_game
    yaml_data = YAML::load_file('saved_game.yaml')
    @display_word = yaml_data[0]
    @word_to_guess = yaml_data[1]
    @wrong_guesses = yaml_data[2]
    @used_letters = yaml_data[3]
    @char_array = yaml_data[4]
    start_game
  end

  # Graphical display of wrong guesses
  def show_hangman(guesses)
    case guesses
      when 0
        puts %Q{
        ____
       |/   |
       |
       |
       |
       |
   ____|____
		  }
      when 1
        puts %Q{
        ____
       |/   |
       |    O
       |
       |
       |
   ____|____
		}
      when 2
        puts %Q{
        ____
       |/   |
       |    O
       |    |
       |    |
       |
   ____|____
		}
      when 3
        puts %Q{
        ____
       |/   |
       |    O
       |   /|
       |    |
       |
   ____|____
		}
      when 4
        puts %Q{
        ____
       |/   |
       |    O
       |   /|\\
       |    |
       |
   ____|____
		}
      when 5
        puts %Q{
        ____
       |/   |
       |    O
       |   /|\\
       |    |
       |   /
   ____|____
		}
      when 6
        puts %Q{
        ____
       |/   |
       |    O
       |   /|\\
       |    |
       |   / \\
   ____|____
		}
    end
  end
end

Game.new