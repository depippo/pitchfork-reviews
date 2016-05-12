class PitchforkReviews::CLI

  def call
    list_reviews
    menu
    goodbye
  end

  def list_reviews
    puts "Welcome"
    @albums = PitchforkReviews::Album.latest
    @albums.each.with_index(1) do |album, i|
      puts "#{i}. #{album.name} by #{album.artist}#{album.best_new_album}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Please enter the number of the album you would like to learn more about, 'list' to see the album list again, or 'exit' to exit the program."
      input = gets.strip.downcase
      if input.to_i > 0
        the_album = @albums[input.to_i-1]
        puts "#{the_album.name}"
      elsif input == "list"
        list_reviews
      else
        puts "Please type 'list' to see available albums, or 'exit' to exit the program."
      end
    end
  end

  def goodbye
    puts "Goodbye! Check back again soon for more new albums."
  end


end
