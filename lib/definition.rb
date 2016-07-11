class Definition
  @@definitions_list = []

  define_method(:initialize) do |word_definition|
    @word_definition = word_definition
    @id = @@definitions_list.length().+(1)
  end

  define_method(:word_definition) do
    @word_definition
  end

  define_method(:id) do
    @id
  end

  define_method(:save) do
    @@definitions_list.push(self)
  end

  define_singleton_method(:all) do
    @@definitions_list
  end

  define_singleton_method(:clear) do
    @@definitions_list = []
  end

  define_singleton_method(:get_def) do
    @@definitions_list.shift
  end
end
