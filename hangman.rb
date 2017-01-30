#Array for all content
words = []

File.open("words.txt").each do |word|
  words << word
end

game_data = {
  :secret_word_letters => words.sample.split(""),
  :revealed_letters => [],
  :correct_guesses => [],
  :incorrect_guesses => []
}

def is_secret_word_letter(letter)
  if secret_word_letters.include?(letter)
    game_data[:correct_guesses] << letter
    game_data[:revealed_letters
end

until game_data[:user_guesses] == game_data[:secret_word_letters] do

  puts "Please type a letter to guess the content of the word"
  user_choice = gets.chomp.to_s
  until user_choice.length == 1
    puts "Please only type one letter."
    user_choice = gets.chomp.to_s
  end
  game_data[:user_guesses] << user_choice[0]
  #Display word so far _ _ _ _

  #Prompt to guess letter

  #Evaluate if letter is in word
  #

end
