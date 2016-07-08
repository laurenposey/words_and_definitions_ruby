require('rspec')
require('definition')

describe(Definition) do
  before() do
    Definition.clear()
  end

  describe("#word_definition") do
    it("returns definition") do
      test_definition = Definition.new("an adorable ball of fluff with kitty ears")
      expect(test_definition.word_definition()).to(eq("an adorable ball of fluff with kitty ears"))
    end
  end

  describe('#id') do
    it("returns definition id") do
      test_definition = Definition.new("an adorable ball of fluff with kitty ears")
      expect(test_definition.id()).to(eq(1))
    end
  end

  describe("#save") do
    it("adds a definition to array of definitions") do
      test_definition = Definition.new("an adorable ball of fluff with kitty ears")
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end

  describe(".all") do
     it("is empty at first") do
       expect(Definition.all()).to(eq([]))
     end
   end

  describe(".clear") do
    it("empties all saved definitions") do
      Definition.new("an adorable ball of fluff with kitty ears").save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end
end
