list = File.readlines "5desk.txt"

# retrieve a random word from list (61407 words!)
word = list.sample
word = word.split("")
remove_last_two = word.pop(2)

# display underscores for each letter of the word AND display hangman picture
hidden_letters = Array.new
word.map {|i| hidden_letters.push("_")}
print hidden_letters
puts ""

incorrect_guesses = 0
# run multiple rounds
until ( (hidden_letters == word) || (incorrect_guesses == 6) ) do
  changes = 0 
  # prompt the player to enter a letter
  puts "This is a test round of my hangman game! ENTER a lowercase LETTER \n"
  letter_guess = gets.chomp
  # if a letter enter matches one from the word, display it instead of the underscore
  i = 0 
  while i < word.length do 
    if letter_guess == word[i] then
      hidden_letters[i] = letter_guess
      changes += 1
    end
    changes
    i += 1
  end
  incorrect_guesses += 1 if changes == 0
  puts ""
  print hidden_letters
  puts "Incorrect guesses #{incorrect_guesses}"

  puts "Save progress? (y/n)"
  answer = gets.chomp
  until ( (answer == "y") || (answer == "n") ) do 
    puts "Not a valid choice, enter 'y' or 'n'."
    answer = gets.chomp
  end
  if answer == "y" then
    fd = IO.sysopen('/home/jakeo/the_odin_project/files-and-serialization/File-I-O-and-Serialization/save_file.txt', "w")
    a = IO.new(fd, "w")
    a.puts incorrect_guesses
    a.print hidden_letters
  end
end
# if a letter doesn't match any from the word, add another piece of the "hang man"

# contine the process until player guesses the word or makes a hangman

# declare end of game
