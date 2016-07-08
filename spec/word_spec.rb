require('rspec')
require('word')

describe(Word) do
  before() do
    Word.clear()
  end

  describe('#word_name') do
    it("returns the word") do
      test_word = Word.new("kitten")
      expect(test_word.word_name()).to(eq("kitten"))
    end
  end

  describe("#save") do
   it("adds a word to array of words") do
      test_word = Word.new("kitten")
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved words") do
      Word.new("kitten").save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

   describe('#id') do
    it("returns word id") do
      test_word = Word.new("kitten")
      expect(test_word.id()).to(eq(1))
    end
  end

  describe(".find") do
    it("returns word by its id number") do
      test_word = Word.new("kitten")
      test_word.save()
      test_word2 = Word.new("puppy")
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end

  describe('#word_meanings') do
   it("is empty at first") do
     test_word = Word.new("kitten")
     expect(test_word.word_meanings()).to(eq([]))
    end
  end

  describe('#add_definition') do
    it("adds a new definition to word") do
      test_word = Word.new("kitten")
      test_definition = Definition.new("an adorable little ball of fluff with kitty ears")
      test_word.add_definition(test_definition)
      expect(test_word.word_meanings()).to(eq([test_definition]))
    end
  end
end
