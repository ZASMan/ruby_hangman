#Array for all content
words = []

File.open("5desk.txt").each do |word|
  words << word
end

secret_word = words.sample

blank_letters = Array.new(secret_word.length) { |x| x+1}

blank_letters.map! { |num| num = "_" }

game_data = {
  :alphabet => ('a'..'z').to_a,
  :secret_word_letters => secret_word.split(""),
  :revealed_letters => blank_letters,
  :correct_guesses => [],
  :incorrect_guesses => [],
  :turns => secret_word.length
}

#This method should first see if it included with any of the secret word letters
#If it is included, compare the revealed_letters array (which at the start will be
#equal to "_" times the length of secret_word) with the secret_word_letters array.
#and then make every "_" in the revealed_letters array equal to the index where the
#letter occurs to the user choice letter

def is_secret_word_letter(letter)
  if secret_word_letters.include?(letter)
    game_data[:correct_guesses] << letter
    game_data[:revealed_letters] << letter
  end
end

puts "Please type a letter to guess the content of the word"

=begin

until user_choice.length == 1 and game_data[:alphabet].include? user_choice do
  puts "Please guess a single letter."
  user_choice = gets.chomp.to_s.downcase!
end

puts "You chose #{user_choice}"
=end
