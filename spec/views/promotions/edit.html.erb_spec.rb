require 'rails_helper'

RSpec.describe "promotions/edit", type: :view do
  let(:promotion) do
    Promotion.create!(
      code: "MyString",
      ends_at: Time.now + 2.days
    )
  end

  before do
    assign(:promotion, promotion)
  end

  it "renders the edit promotion form" do
    render

    assert_select "form[action=?][method=?]", promotion_path(promotion), "post" do
      assert_select "input[name=?]", "promotion[code]"
    end
  end
end
