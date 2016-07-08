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
end
