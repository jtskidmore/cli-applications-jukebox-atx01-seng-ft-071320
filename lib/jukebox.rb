require 'pry'


def help 
  puts "I accept the following commands:"
  puts  "- help : displays this help message"
  puts  "- list : displays a list of songs you can play"
  puts  "- play : lets you choose a song to play"
  puts  "- exit : exits this program"
end

def list(songs)
  
  counter = 1
  songs.each do |song|
    puts "#{counter}. " + song
    counter += 1
  end
  
end

def play(songs)
  puts "Please enter a song name or number:"
  
  user_input = gets.strip
  
  song_names = []
  
  songs.each do |song|
    song_names << songs[song.index("-") + 2, song.length+1]
  end
  
  input_is_song_name = song_names.include?(user_input)
  input_is_full_name = songs.include?(user_input)
  
  if input_is_full_name == false && input_is_song_name == false
    if songs[user_input.to_i - 1] != nil && user_input.to_i != 0
      puts "Playing #{songs[user_input.to_i - 1]}"
    elsif user_input.to_i == 0 || songs[user_input.to_i - 1] == nil
      puts "Invalid input, please try again"
    end
  elsif input_is_song_name 
    puts "Playing #{songs[song_names.index(user_input)]}"
  elsif input_is_full_name
    puts "Playing #{songs[songs.index(user_input)]}"
  end
  
end

def exit_jukebox
  puts "Goodbye"
end

def run(songs)
  
  puts "Please enter a command:"
  
  user_input = gets.strip
  
  until user_input == 'exit'
    if user_input == 'list'
      list
    elsif user_input == 'help'
      help
    elsif user_input == 'play'
      play(songs)
    end
    user_input = gets.strip
  end
  
  exit_jukebox
  
end


