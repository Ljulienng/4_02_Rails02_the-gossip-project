require 'rails_helper'

RSpec.describe "undercomments/index", type: :view do
  before(:each) do
    assign(:undercomments, [
      Undercomment.create!(
        :content => "MyText"
      ),
      Undercomment.create!(
        :content => "MyText"
      )
    ])
  end

  it "renders a list of undercomments" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
