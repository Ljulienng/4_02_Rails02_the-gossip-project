require 'rails_helper'

RSpec.describe "undercomments/new", type: :view do
  before(:each) do
    assign(:undercomment, Undercomment.new(
      :content => "MyText"
    ))
  end

  it "renders new undercomment form" do
    render

    assert_select "form[action=?][method=?]", undercomments_path, "post" do

      assert_select "textarea[name=?]", "undercomment[content]"
    end
  end
end
