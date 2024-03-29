require 'rails_helper'

RSpec.describe "promotions/new", type: :view do
  before do
    assign(:promotion, Promotion.new(
                         code: "MyString",
                         ends_at: Time.now + 2.days
                       ))
  end

  it "renders new promotion form" do
    render

    assert_select "form[action=?][method=?]", promotions_path, "post" do
      assert_select "input[name=?]", "promotion[code]"
    end
  end
end
