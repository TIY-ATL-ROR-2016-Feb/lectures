require "pry"

class Song
  attr_reader :artist, :title
  attr_accessor :album
#  attr_writer :album

  def initialize(artist, title, album=nil)
    @artist = artist
    @title = title
    @album = album
  end

  ## Attr Accessor gives you both!

  # Attr Reader equivalent
  # def foo
  #   @foo
  # end

  # Attr Writer equivalent
  # def album=(new_album)
  #   @album = new_album
  # end
end

binding.pry
