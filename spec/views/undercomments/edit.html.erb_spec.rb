require 'rails_helper'

RSpec.describe "undercomments/edit", type: :view do
  before(:each) do
    @undercomment = assign(:undercomment, Undercomment.create!(
      :content => "MyText"
    ))
  end

  it "renders the edit undercomment form" do
    render

    assert_select "form[action=?][method=?]", undercomment_path(@undercomment), "post" do

      assert_select "textarea[name=?]", "undercomment[content]"
    end
  end
end
