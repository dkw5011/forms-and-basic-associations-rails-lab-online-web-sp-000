class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  # add associations here

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_id
     self.genre ? self.genre.name : nil
  end

  def notes_contents=(attributes)
    
    attributes.each do |attribute|
      if !attribute.empty?
      
      note = Note.create(content: attribute, song_id: self.id)
      self.notes << note
      end
    end
  end

end
