require 'rails_helper'

RSpec.describe "/plans", type: :request do
  let(:agency) do
    create(:agency)
  end

  let(:valid_attributes) do
    {
      agency_id: agency.id,
      title: Faker::Alphanumeric.alpha(number: 10),
      description: Faker::Alphanumeric.alpha(number: 200),
      price: Faker::Number.between(from: 100, to: 600)
    }
  end

  let(:invalid_attributes) do
    {
      agency_id: agency.id,
      title: nil,
      description: nil,
      price: nil
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      Plan.create! valid_attributes
      get agency_plans_url(agency)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      plan = Plan.create! valid_attributes
      get agency_plan_url(agency, plan)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_agency_plan_url(agency)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      plan = Plan.create! valid_attributes
      get edit_agency_plan_url(agency, plan)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Plan" do
        expect do
          post agency_plans_url(agency), params: { agency: agency, plan: valid_attributes }
        end.to change(Plan, :count).by(1)
      end

      it "redirects to the created plan" do
        post agency_plans_url(agency), params: { plan: valid_attributes }

        expect(response).to redirect_to(agency_plan_url(agency, Plan.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Plan" do
        expect do
          post agency_plans_url(agency), params: { plan: invalid_attributes }
        end.to change(Plan, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post agency_plans_url(agency), params: { plan: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        {
          title: "New Title"
        }
      end

      it "updates the requested plan" do
        plan = Plan.create! valid_attributes
        patch agency_plan_url(agency, plan), params: { plan: new_attributes }
        plan.reload
        expect(plan.title).to eq("New Title")
      end

      it "redirects to the plan" do
        plan = Plan.create! valid_attributes
        patch agency_plan_url(agency, plan), params: { plan: new_attributes }
        plan.reload
        expect(response).to redirect_to(agency_plan_url(agency, plan))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        plan = Plan.create! valid_attributes
        patch agency_plan_url(agency, plan), params: { plan: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested plan" do
      plan = Plan.create! valid_attributes
      expect do
        delete agency_plan_url(agency, plan)
      end.to change(Plan, :count).by(-1)
    end

    it "redirects to the plans list" do
      plan = Plan.create! valid_attributes
      delete agency_plan_url(agency, plan)
      expect(response).to redirect_to(agency_plans_url(agency))
    end
  end
end
