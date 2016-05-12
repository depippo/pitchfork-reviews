what should each album have?

name
artist
genre
best new music (y/n)

  more info should give
    score
    blurb
    link to full review

    ("http://pitchfork.com/reviews/albums/")

    album_1 = self.new
    album_1.name = "The Colour in Anything"
    album_1.artist = "James Blake"
    album_1.genre = "Pop/R&B, Electronic"
    album_1.score = "8.2"
    album_1.best_new_album = true
    album_1.summary = "Clocking in at 76 minutes, The Colour in Anything is James Blake’s wonderfully messy dive into maximalism."
    album_1.url = "http://pitchfork.com/reviews/albums/21906-the-colour-in-anything/"

    album_2 = self.new
    album_2.name = "Cult Following"
    album_2.artist = "Little Scream"
    album_2.genre = "Folk/Country"
    album_2.score = "7.5"
    album_2.summary = "Laurel Sprengelmeyer's Cult Following is a flowing record with guests including Sufjan Stevens, Sharon Van Etten, the National’s Dessner brothers, and TV on the Radio’s Kyp Malone."
    album_2.best_new_album = false
    album_2.url = "http://pitchfork.com/reviews/albums/21861-cult-following/"
    
    [album_1, album_2]


    ./bin/console
    PitchforkReviews::Album.scrape_pitchfork