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

#This method should first see if it included with any of the secret word letters
#If it is included, compare the revealed_letters array (which at the start will be
#equal to "_" times the length of secret_word) with the secret_word_letters array.
#and then make every "_" in the revealed_letters array equal to the index where the
#letter occurs to the user choice letter

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

def game_over?(turns, revealed_word_letters)
end

puts "Please type a letter to guess the content of the word"

print game_data[:secret_word_letters]
puts ""
print game_data[:revealed_letters]
puts ""

turn = 1
while turn < game_data[:turns].length
  puts "Please guess a letter in the word."
  puts ""
  user_choice = gets.chomp.to_s.downcase!
  until game_data[:alphabet].include? user_choice and user_choice.length == 1 do
    puts "Please choose a single letter in the alphabet to guess the content of the word."
    user_choice = gets.chomp.to_s.downcase!
  end
  is_secret_word_letter(user_choice)
  #Logic here
  #turn +=1



end

until user_choice.length == 1 and game_data[:alphabet].include? user_choice do
  puts "Please guess a single letter."
  user_choice = gets.chomp.to_s.downcase!
end

puts "You chose #{user_choice}"

