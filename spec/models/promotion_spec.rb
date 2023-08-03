require 'rails_helper'

RSpec.describe Promotion, type: :model do
  context "when code expires tomorrow" do
    it "active returns true" do
      promo = create(:promotion, ends_at: Time.now + 1.day)
      expect(promo.active?).to be(true)
    end
  end

  context "when code already expired" do
    it "active returns false" do
      promo = create(:promotion, ends_at: Time.now - 1.day)
      expect(promo.active?).to be(false)
    end
  end
end
