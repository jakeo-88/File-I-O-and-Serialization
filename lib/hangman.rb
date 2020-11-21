dictionary = File.readlines "5desk.txt"

# retrieve a random word from list (61407 words!)
word = dictionary.sample
puts word
word = word.split("")
remove_last_two = word.pop(2)
print word
puts ""

# display underscores for each letter of the word AND display hangman picture
hidden_letters = Array.new
word.map {|i| hidden_letters.push("_")}

print hidden_letters
# prompt the player to enter a letter

  # test to make sure it's a letter

# if a letter enter matches one from the word, display it instead of the underscore

# if a letter doesn't match any from the word, add another piece of the "hang man"

# contine the process until player guesses the word or makes a hangman

# declare end of game
