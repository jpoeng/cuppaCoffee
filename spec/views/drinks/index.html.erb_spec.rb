require 'rails_helper'

RSpec.describe "drinks/index", type: :view do
  before(:each) do
    assign(:drinks, [
      Drink.create!(
        :name => "Name",
        :cups => 1,
        :brand => "Brand"
      ),
      Drink.create!(
        :name => "Name",
        :cups => 1,
        :brand => "Brand"
      )
    ])
  end

  it "renders a list of drinks" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Brand".to_s, :count => 2
  end
end
