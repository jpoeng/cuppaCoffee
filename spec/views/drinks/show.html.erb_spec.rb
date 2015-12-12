require 'rails_helper'

RSpec.describe "drinks/show", type: :view do
  before(:each) do
    @drink = assign(:drink, Drink.create!(
      :name => "Name",
      :cups => 1,
      :brand => "Brand"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Brand/)
  end
end
