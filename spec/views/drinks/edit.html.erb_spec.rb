require 'rails_helper'

RSpec.describe "drinks/edit", type: :view do
  before(:each) do
    @drink = assign(:drink, Drink.create!(
      :name => "MyString",
      :cups => 1,
      :brand => "MyString"
    ))
  end

  it "renders the edit drink form" do
    render

    assert_select "form[action=?][method=?]", drink_path(@drink), "post" do

      assert_select "input#drink_name[name=?]", "drink[name]"

      assert_select "input#drink_cups[name=?]", "drink[cups]"

      assert_select "input#drink_brand[name=?]", "drink[brand]"
    end
  end
end
