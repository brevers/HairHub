require 'rails_helper'

RSpec.describe Plan, type: :model do
  let(:valid_attributes) do
    {
      agency: create(:agency),
      title: Faker::Alphanumeric.alpha(number: 10),
      description: Faker::Alphanumeric.alpha(number: 200),
      price: Faker::Number.between(from: 100, to: 600)
    }
  end

  let(:invalid_attributes) do
    {
      agency: create(:agency),
      title: nil,
      description: nil,
      price: nil
    }
  end

  describe "save" do
    context "with valid attributes" do
      it "creates new plan" do
        subject = described_class.new(valid_attributes)

        expect(subject.save).to be(true)
        expect(subject.errors).to be_empty
      end
    end
  end

  context "with invalid attributes" do
    it "adds validation errors" do
      subject = described_class.create(invalid_attributes)

      expect(subject.save).to be(false)
      expect(subject.errors).not_to be_empty
    end
  end
end
