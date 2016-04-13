require './spec_helper'
require '../enumerable'

describe Enumerable do
  let(:list) { [1,2,3,4,5,6] }

  describe "#my_each" do
    it "returns each element if a block is given" do
      expect(list.my_each { |i| i + 1 }).to eq([1,2,3,4,5,6])
    end

    it "returns self list if no block is given" do
      expect(list.my_each).to eq([1,2,3,4,5,6])
    end
  end

  describe "#my_all?" do
    context "block is given" do
      it "returns true if the condition is true for all the elements" do
        expect(list.my_all? { |i| i < 7 }).to be true
      end

      it "returns false if the condition is false for all the elements" do
        expect(list.my_all? { |i| i == 1}).to be false
      end
    end

    context "block is not given" do
      it "returns false if any element is nil" do
        expect([1,2,nil,3,4,5].my_all?).to be false
      end

      it "returns false if any element is false" do
        expect([1,2,false,3,4,5].my_all?).to be false
      end

      it "returns true if none of the elements are nil or false" do
        expect(list.my_all?).to be true
      end
    end
  end

  describe "#my_any?" do
    context "block is given" do
      it "returns true if the condition is true for any element" do
        expect(list.my_any? { |i| i < 7 }).to be true
      end

      it "returns false if the condition is false for any element" do
        expect(list.my_any? { |i| i == 0}).to be false
      end
    end

    context "block is not given" do
      it "returns false if any element is nil" do
        expect([1,2,nil,3,4,5].my_any?).to be false
      end

      it "returns false if any element is false" do
        expect([1,2,false,3,4,5].my_any?).to be false
      end

      it "returns true if none of the elements are nil or false" do
        expect(list.my_any?).to be true
      end
    end
  end

  describe "#my_none?" do
    context "block is given" do
      it "returns true if none of the elements fall in the condition" do
        expect(list.my_none? { |i| i > 7 }).to be true
      end

      it "returns false if the condition is true for any element" do
        expect(list.my_none? { |i| i == 1}).to be false
      end
    end

    context "block is not given" do
      it "returns false if any element is true" do
        expect([1,2,true,3,4,5].my_none?).to be false
      end

      it "returns true if none of the elements are false" do
        expect(list.my_none?).to be true
      end
    end
  end

  describe "#my_count" do
    context "arg is nil and block is not given" do
      it "should return the number of elements" do
        expect(list.my_count).to eq(6)
      end
    end

    context "arg is given" do
      it "should return the number of times the element specified in the argument appears" do
        expect(list.my_count(3)).to eq(1)
      end
    end

    context "block is given" do
      it "returns the number of elements that satisfy the condition" do
        expect(list.my_count{ |i| i < 4 }).to eq(3)
      end
    end
  end

  describe "my_map" do
    context "block is not given" do
      it "should return self object" do
        expect(list.my_map).to eq([1,2,3,4,5,6])
      end
    end

    context "block is given" do
      it "should return a new enumerable that satisfy the condition" do
        expect(list.my_map { |i| i + 1 }).to eq([2,3,4,5,6,7])
      end
    end
  end

end