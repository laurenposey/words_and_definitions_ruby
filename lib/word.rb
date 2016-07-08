class Word
  define_method(:initialize) do |word_name|
    @word_name = word_name
  end

  define_method(:word_name) do
    @word_name
  end
end
