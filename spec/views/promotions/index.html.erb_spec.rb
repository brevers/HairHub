require 'rails_helper'

RSpec.describe "promotions/index", type: :view do
  before do
    assign(:promotions, [
             Promotion.create!(
               code: "Code",
               ends_at: Time.now + 2.days
             ),
             Promotion.create!(
               code: "Code",
               ends_at: Time.now + 2.days
             )
           ])
  end

  it "renders a list of promotions" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Code".to_s), count: 2
  end
end
