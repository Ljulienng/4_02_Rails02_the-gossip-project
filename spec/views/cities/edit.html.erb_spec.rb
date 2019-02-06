require 'rails_helper'

RSpec.describe "cities/edit", type: :view do
  before(:each) do
    @city = assign(:city, City.create!(
      :string => "",
      :string => ""
    ))
  end

  it "renders the edit city form" do
    render

    assert_select "form[action=?][method=?]", city_path(@city), "post" do

      assert_select "input[name=?]", "city[string]"

      assert_select "input[name=?]", "city[string]"
    end
  end
end
