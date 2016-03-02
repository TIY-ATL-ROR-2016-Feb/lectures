WORDS = [
  "puppies", "ruby", "lunch", "margaritas",
  "programming", "sleep", "travel", "vacations",
  "houses", "broke", "scotch", "orange", "grading"
]

class StaticDict
  def get_word
    WORDS.sample
  end
end
