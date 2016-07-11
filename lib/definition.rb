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

  define_singleton_method(:find) do |id|
    found_definition = nil
    @@definitions_list.each() do |definition|
      if definition.id().eql?(id.to_i())
        found_definition = definition
      end
    end
    found_definition
  end

end
