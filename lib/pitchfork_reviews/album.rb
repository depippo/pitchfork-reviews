class PitchforkReviews::Album
  attr_accessor :name, :album, :artist, :genre, :score, :summary, :best_new_album, :url

  def self.latest
    self.scrape_pitchfork
  end

  def self.scrape_albums
    albums = []
    albums << self.scrape_pitchfork
    albums
  end

  def self.scrape_pitchfork
    albums = []
    doc = Nokogiri::HTML(open("http://pitchfork.com/reviews/albums/"))
    doc.css(".review").each do |review|
      album = self.new
      album.name = review.css(".title").text
      album.artist = review.css("div.album-artist ul li").text
      album.genre = review.css("ul.genre-list.before.inline").text
      album.url = review.css(".album-link")[0]["href"]
        if review.text.include?("Best New Album")
          album.best_new_album = " * Best New Album *"
        end
      page = Nokogiri::HTML(open("http://pitchfork.com#{album.url}"))
      album.score = page.css(".score-circle").text
      album.summary = page.css("div.abstract").text.gsub("Â" , "").gsub("â" , "'")
    albums << album
    end
    albums
  end

  def self.deep_scrape

    
  end


def self.scrape_pitchfork_to_hash
    albums = []
    doc = Nokogiri::HTML(open("http://pitchfork.com/reviews/albums/"))
    doc.css(".review").each do |review|
      album = {
        name: review.css(".title").text,
        artist: review.css("div.album-artist ul li").text,
        genre: review.css("ul.genre-list.before.inline").text,
        url: review.css(".album-link")[0]["href"]}
        if review.text.include?("Best New Album")
          album[:best_new_album] = true
        end
  
      albums << album
    end
    albums
  end

end

