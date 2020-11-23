list = File.readlines "5desk.txt"

# retrieve a random word from list (61407 words!)
word = list.sample
word = word.split("")
remove_last_two = word.pop(2)

word = word.join("")
word.downcase!
word = word.split("")

# display underscores for each letter of the word AND display hangman picture
hidden_letters = Array.new
word.map {|i| hidden_letters.push("_")}

incorrect_guesses = 0

# give option to load game
puts "load previous game? (y/n)"
load_answer = gets.chomp
until ( (load_answer == 'y') || (load_answer == 'n') ) do
  puts "That's not a valid choice. Choose 'y' or 'n'."
end
if load_answer == 'y' then
  saved_file = File.readlines "save_file.txt"
  saved_file = saved_file.join("").split(",")
  
  incorrect_guesses = saved_file[0].to_i
  word = saved_file[1].split("")
  hidden_letters = saved_file[2].split("")
end

print hidden_letters
print " Incorrect guesses #{incorrect_guesses}" 
puts ""

# run multiple rounds
until ( (hidden_letters == word) || (incorrect_guesses == 6) ) do
  changes = 0 
  # prompt the player to enter a letter
  puts "Let's play hangman! ENTER a lowercase LETTER \n"
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
  puts " Incorrect guesses #{incorrect_guesses}"
  
  if ( (incorrect_guesses == 6) || (hidden_letters == word) ) then
    puts "That's game!"
    break
  end

  puts "Save progress and exit? (y/n)"
  save_answer = gets.chomp
  until ( (save_answer == "y") || (save_answer == "n") ) do 
    puts "That's not a valid choice. Choose 'y' or 'n'."
    save_answer = gets.chomp
  end
  if save_answer == "y" then
    fd = IO.sysopen('/home/jakeo/the_odin_project/files-and-serialization/File-I-O-and-Serialization/save_file.txt', "w")
    a = IO.new(fd, "w")
    a.print "#{incorrect_guesses},#{word.join("")},#{hidden_letters.join("")}"
    
    break
  end
end
# if a letter doesn't match any from the word, add another piece of the "hang man"

# contine the process until player guesses the word or makes a hangman

# declare end of game
