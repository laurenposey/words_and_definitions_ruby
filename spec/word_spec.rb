require('rspec')
require('word')

describe(Word) do

  describe('#word_name') do
   it("returns the word") do
     test_word = Word.new("kitten")
     expect(test_word.word_name()).to(eq("kitten"))
    end
  end
end
