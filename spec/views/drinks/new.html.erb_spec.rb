require 'rails_helper'

RSpec.describe "drinks/new", type: :view do
  before(:each) do
    assign(:drink, Drink.new(
      :name => "MyString",
      :cups => 1,
      :brand => "MyString"
    ))
  end

  it "renders new drink form" do
    render

    assert_select "form[action=?][method=?]", drinks_path, "post" do

      assert_select "input#drink_name[name=?]", "drink[name]"

      assert_select "input#drink_cups[name=?]", "drink[cups]"

      assert_select "input#drink_brand[name=?]", "drink[brand]"
    end
  end
end
