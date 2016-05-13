class PitchforkReviews::CLI

  def call
    list_reviews
    menu
    goodbye
  end

  def list_reviews
    puts
    puts "Welcome! Here are the most recent album reviews from Pitchfork."
    puts
    @albums = PitchforkReviews::Album.scrape_pitchfork
    @albums.each.with_index(1) do |album, i|
      puts "#{i}. #{album.name} by #{album.artist}#{album.best_new_album}"
    end
    puts
  end

  def sort_by_score
    @albums = PitchforkReviews::Album.scrape_pitchfork
    @albums.sort! { |a,b| b.score <=> a.score}
    @albums.each.with_index(1) do |album, i|
      puts "#{i}. #{album.name} by #{album.artist}#{album.best_new_album}, #{album.score}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Please enter the number of the album you would like to read more about."
      puts "Enter 'sort' to sort the albums by review score."
      puts "Enter 'list' to see the album list again."
      puts "Enter 'exit' to exit the program."
      input = gets.strip.downcase
      if input.to_i.between?(1,24)
        the_album = @albums[input.to_i-1]
        puts
        puts "#{the_album.name}"
        puts "by"
        puts "#{the_album.artist}"
        puts "#{the_album.genre}"
        puts
        puts "Score: #{the_album.score} #{the_album.best_new_album}"
        puts 
        puts "Summary:"
        puts "#{the_album.summary}"
        puts
        puts "Read the full review at http://pitchfork.com#{the_album.url}"
        puts
      elsif input == "list"
        list_reviews
      elsif input =="sort"
        sort_by_score
      end
    end
  end

  def goodbye
    puts "Goodbye! Check back again soon for more new albums."
  end

end
