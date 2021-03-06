class Song < ActiveRecord::Base
  belongs_to :artist

  def artist_name
    self.artist.name if self.artist
  end

  def artist_name=(name)
    if name != ""
      self.artist = Artist.find_or_create_by(name: name)
    else
      self.artist = Artist.create(name: name)
    end
    self.artist.name
  end
end
