class Word
@@word_list = []

  define_method(:initialize) do |word_name|
    @word_name = word_name
    @id = @@word_list.length().+(1)
  end

  define_method(:id) do
    @id
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

  define_singleton_method(:find) do |id|
    found_word = nil
    @@word_list.each() do |word|
      if word.id().eql?(id)
        found_word = word
      end
    end
    found_word
  end
end
