require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:pies) { Dessert.new("pies", 30, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(pies.type).to eq("pies")
    end

    it "sets a quantity" do
      expect(pies.quantity).to eq(30)
    end

    it "starts ingredients as an empty array" do
      expect(pies.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      pies.add_ingredient("suggar")
      expect(pies.ingredients).to include("suggar")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array"
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      pies.eat(5)
      expect(pies.quantity).to eq(25)
    end

    it "raises an error if the amount is greater than the quantity" do
      pies.eat(35)
      expect(pies.quantity).to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(chef).to receive("Chef Steven")
      expect(pies.serve).to eq("Chef Steven has made 30 pies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(pies)
      pies.make_more
    end
  end
end
