require 'rails_helper'

RSpec.describe "promotions/show", type: :view do
  before do
    assign(:promotion, Promotion.create!(
                         code: "Code",
                         ends_at: Time.now + 2.days
                       ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Code/)
  end
end