class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(genre_name)
    self.genre = Genre.find_by(name: genre_name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(notes_arr)
    notes_arr.each do |note|
      if !note.empty?
        new_note = Note.find_or_create_by(content: note)
        self.notes << new_note
      end
    end
  end

  def note_contents
    contents = self.notes.map do |note|
      note.content
    end
    contents
  end

end
