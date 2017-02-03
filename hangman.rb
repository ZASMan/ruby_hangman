#Array for all content
words = []

File.open("5desk.txt").each do |word|
  words << word
end

secret_word = words.sample

secret_word_blanks = Array.new(secret_word.length) { |x| x+1}
secret_word_blanks.map! { |num| num = "_" }

game_data = {
  :alphabet => ('a'..'z').to_a,
  :secret_word_letters => secret_word.split(""),
  :revealed_letters => secret_word_blanks,
  :correct_guesses => [],
  :incorrect_guesses => [],
  :turns => secret_word.length
}

def is_secret_word_letter(letter)
  if secret_word_letters.include?(letter)
    game_data[:correct_guesses] << letter
    indices = []
    game_data[:secret_word_letters].each do |x|
      if x == letter
        indices << game_data[:secret_word_letters].index(letter)
      end
    end
    indices.each do |index|
      game_data[:revealed_letters].map! { |x| x = letter if game_data[:revealed_letters].index(x) == index }
    end
  else
    game_data[:incorrect_guesses] << letter
  end
end

def show_progress
  print game_data[:secret_word_letters]
  puts ""
  print game_data[:revealed_letters]
  puts ""
end

def game_over?(turns, revealed_word_letters)
end

puts "Please type a letter to guess the content of the word"

#Convert Progress so far into module/game

module Hangman
  class Game

    def initialize
      words = []
      File.open("5desk.txt").each do |word|
        words << word
      end
      @secret_word = words.sample
      secret_word_blanks = Array.new(@secret_word.length) { |x| x+1}
      secret_word_blanks.map! { |num| num = "_" }
      @alphabet = ('a'..'z').to_a
      @secret_word_letters = @secret_word.split("")
      @revealed_letters = secret_word_blanks
      @correct_guesses = []
      @incorrect_guesses = []
      @turns = @secret_word.length
      @secret_word = []
      @game_over = []
    end

    def show_game_progress
    end

    def play_game
      turn = 1
      while turn < game_data[:turns]
        puts "Please guess a letter in the word."
        puts ""
        user_choice = gets.chomp.to_s
        until game_data[:alphabet].include? user_choice and user_choice.length == 1 do
          puts "Please choose a single letter in the alphabet to guess the content of the word."
          user_choice = gets.chomp.to_s
        end
        puts "Evaluating user choice"
        is_secret_word_letter(user_choice)
        show_progress()
        turn +=1
      end
    end

  end
end

