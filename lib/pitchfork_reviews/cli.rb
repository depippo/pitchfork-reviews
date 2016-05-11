require 'open-uri'

class PitchforkReviews::CLI

  def call
    puts "Recent Reviews"
    scrape
  end

  def list_reviews
    puts <<-DOC
    1. James Blake - The Colour in Anything
    2. Little Scream - Cult Following
    DOC
  end

  def scrape
    doc = Nokogiri::HTML(open("http://pitchfork.com/reviews/albums/"))
    doc_html = doc.to_html
    puts "#{doc_html}"
  end

end
