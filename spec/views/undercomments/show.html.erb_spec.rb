require 'rails_helper'

RSpec.describe "undercomments/show", type: :view do
  before(:each) do
    @undercomment = assign(:undercomment, Undercomment.create!(
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
