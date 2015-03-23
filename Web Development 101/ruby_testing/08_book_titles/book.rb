class Book
@title
attr_accessor :title

  def initialize(title="")
    @title = title
  end

  def title
    output = []
    little_words = ["and", "in", "the", "of", "a", "an"]
    @title.split(' ').each do |word|
    if !little_words.include?(word)
      output << word.capitalize
    else
      output << word
    end
    end
    output[0].capitalize!
    output.join(' ')
end
end

@book = Book.new('what i wish i knew when i was 20')
puts @book.title
