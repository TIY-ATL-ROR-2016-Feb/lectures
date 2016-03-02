class FileDict
  def initialize(filepath)
    # @words = []
    # File.open(filepath, "r") do |f|
    #   f.each_line do |line|
    #     @words.push(line)
    #   end
    # end

    @words = File.read(filepath).split("\n")
  end

  def get_word
    @words.sample
  end
end
