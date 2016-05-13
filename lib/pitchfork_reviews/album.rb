class PitchforkReviews::Album
  attr_accessor :name, :artist, :genre, :score, :summary, :best_new_album, :url

  def self.scrape_pitchfork
    albums = []
    doc = Nokogiri::HTML(open("http://pitchfork.com/reviews/albums/"))
    doc.css(".review").each do |review|
      all_genres = []
      all_artists = []
      all_scores = []
      album = self.new
      album.name = review.css(".title").text
      
      review.css("div.album-artist ul li").each do |a|
        all_artists << a.text
        end
      album.artist = all_artists.to_s.gsub('"', "").gsub('[', "").gsub("]", "")
      
      review.css("ul.genre-list.before.inline li").each do |g|
        all_genres << g.text
        end
      album.genre = all_genres.to_s.gsub('"', "").gsub('[', "").gsub("]", "")
      
      album.url = review.css(".album-link")[0]["href"]
        if review.text.include?("Best New Album")
          album.best_new_album = " ** Best New Album **"
        end
      page = Nokogiri::HTML(open("http://pitchfork.com#{album.url}"))
      
      album.score = page.css(".score-circle").text[0..2]
      album.summary = page.css("div.abstract").text.gsub("Â" , "").gsub("â" , "'")
    albums << album
    end
    albums
  end

 end
