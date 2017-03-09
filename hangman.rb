class Game
  attr_accessor :alphabet, :secret_word, :secret_word_letters, :revealed_letters, :correct_guesses,
      :incorrect_guesses, :turns, :secret_word, :game_over

  def initialize
    puts "Welcome to hangman!"
    puts ""
    words = []
    File.open("5desk.txt").each do |word|
      words << word.downcase.gsub!(/\W+/, '')
    end
    puts "Secret word chosen!"
    #Alphabet to control user input
    @alphabet = ('a'..'z').to_a
    #Choose Random Word
    @secret_word = words.sample
    secret_word_blanks = Array.new(@secret_word.length) { |x| x+1}
    secret_word_blanks.map! { |num| num = "_" }
    @secret_word_letters = @secret_word.split("")
    @revealed_letters = secret_word_blanks
    @correct_guesses = []
    @incorrect_guesses = []
    @turns = @secret_word.length
    @game_over = false
    #Begin Game
    self.play_game
  end

  def show_game_progress
    # TODO: Remove secret word in the final version :P
    puts "Here is the secret word:"
    puts ""
    print @secret_word_letters
    puts ""
    puts ""
    puts "Here are the reavealed letters:"
    puts ""
    print @revealed_letters
    puts ""
    puts "Here are the incorrect guesses:"
    puts ""
    print @incorrect_guesses
    puts ""
    puts "Here are the correct guesses:"
    puts ""
    print @correct_guesses
    puts ""
  end

  def game_over_check
     if @revealed_letters == @secret_word_letters
       @game_over == true
     end
  end

  def is_secret_word_letter(letter)
    if @secret_word_letters.include?(letter)
      @correct_guesses << letter
      @secret_word_letters.each.with_index do |x, i|
        if x == letter
          @revealed_letters[i] = letter
        end
      end
    else
      incorrect_guesses << letter
    end
  end

  # Todo: Implement ending game if turns are over OR game over is true
  def play_game
    turn = 1
    while turn < @turns
      puts "Please guess a letter in the word."
      puts ""
      user_choice = gets.chomp.to_s
      until @alphabet.include? user_choice and user_choice.length == 1 do
        puts "Please choose a single letter in the alphabet to guess the content of the word."
        user_choice = gets.chomp.to_s
      end
      puts "Evaluating user choice"
      is_secret_word_letter(user_choice)
      self.show_game_progress
      turn +=1
      puts "Turn #{turn} complete!"
      self.game_over_check
    end
  end
end

game =  Game.new
