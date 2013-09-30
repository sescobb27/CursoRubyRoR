require 'spec_helper'

describe Product do
    it "should validate product name" do
        should validate_presence_of :name
    end
    it { should validate_presence_of :price }
    it { should validate_uniqueness_of :bar_code }
    it { should validate_numericality_of :price }
    context "Invalid Products" do

      it "name can't be blank" do
        expect(FactoryGirl.build :product, name: nil).not_to be_valid
        expect(FactoryGirl.build :product, name: '').not_to be_valid
      end

      it "bar_code can't be blank" do
        expect(FactoryGirl.build :product, bar_code: nil).not_to be_valid
      end

      it "bar_code should be unique" do
        first_product = FactoryGirl.create :product, bar_code: "1234"
        second_product = FactoryGirl.build :product, bar_code: "1234"
        expect(second_product).not_to be_valid
      end

      it "name's length can't be too short" do
        expect(FactoryGirl.build :product, name: 'Simon').not_to be_valid
      end

      it "price should be at least 5 dollars" do
        expect(FactoryGirl.build :product, price: 2).not_to be_valid
      end
    end
end
