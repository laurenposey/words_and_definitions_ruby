class Word
@@word_list = []

  define_method(:initialize) do |word_name|
    @word_name = word_name
  end

  define_method(:word_name) do
    @word_name
  end

  define_method(:save) do
    @@word_list.push(self)
  end

  define_singleton_method(:all) do
    @@word_list
  end

  define_singleton_method(:clear) do
    @@word_list = []
  end
end
