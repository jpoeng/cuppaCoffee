require 'rails_helper'

# describe Drink, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe "number of cups" do
  it "should be between 1 and 9" do
    drink = Drink.new(name: "latte", brand: "Starbucks", cups: -1)
    drink.valid?
    expect(drink.errors[:cups].size).to eq 1
  end

  it "should enforce drink to have a name" do
    drink = Drink.new(name: "", brand: "Starbucks", cups: 1)
    drink.valid?
    expect(drink.errors[:name].size).to eq 1
  end
end