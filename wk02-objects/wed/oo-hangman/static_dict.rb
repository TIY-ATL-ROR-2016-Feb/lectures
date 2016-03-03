WORDS = [
  "puppies", "ruby", "lunch", "margaritas",
  "programming", "sleep", "travel", "vacations",
  "houses", "broke", "scotch", "orange", "grading"
]

class StaticDict
  def initialize
    @word = nil
  end

  def get_word
    word = WORDS.sample
    until word != @word
      word = WORDS.sample
    end
    @word = word
  end
end
