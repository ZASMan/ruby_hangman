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
    puts "Here is the secret word:"
    puts ""
    print @secret_word_letters
    puts ""
    puts "Here are the reavealed letters:"
    puts ""
    print @revealed_letters
    puts ""
    puts "Here are the incorrect guesses:"
    puts ""
    print @incorrect_guesses
    puts "Here are the correct guesses:"
    puts ""
    print @correct_guesses
  end

  def is_secret_word_letter(letter)
    if @secret_word_letters.include?(letter)
      @correct_guesses << letter
      indices = []
      @secret_word_letters.each do |x|
        if x == letter
          indices << @secret_word_letters.index(letter)
        end
      end
    indices.each do |index|
      @revealed_letters.map! { |x| x = letter if @revealed_letters.index(x) == index }
    end
    else
      incorrect_guesses << letter
    end
  end

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
    end
  end
end

game =  Game.new
