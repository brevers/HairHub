require "rails_helper"

RSpec.describe PlansController, type: :routing do
  let(:agency_id) { create(:agency).id.to_s }
  let(:agency_plans_path) { "/agencies/#{agency_id}/plans" }

  describe "routing" do
    it "routes to #index" do
      expect(get: agency_plans_path).to route_to(
        controller: "plans", action: 'index', agency_id: agency_id
      )
    end

    it "routes to #new" do
      expect(get: "#{agency_plans_path}/new").to route_to(
        controller: "plans", action: 'new', agency_id: agency_id
      )
    end

    it "routes to #show" do
      expect(get: "#{agency_plans_path}/1").to route_to(
        controller: "plans", action: 'show', agency_id: agency_id, id: "1"
      )
    end

    it "routes to #edit" do
      expect(get: "#{agency_plans_path}/1/edit").to route_to(
        controller: "plans", action: 'edit', agency_id: agency_id, id: "1"
      )
    end

    it "routes to #create" do
      expect(post: agency_plans_path.to_s).to route_to(
        controller: "plans", action: 'create', agency_id: agency_id
      )
    end

    it "routes to #update via PUT" do
      expect(put: "#{agency_plans_path}/1").to route_to(
        controller: "plans", action: 'update', agency_id: agency_id, id: "1"
      )
    end

    it "routes to #update via PATCH" do
      expect(patch: "#{agency_plans_path}/1").to route_to(
        controller: "plans", action: 'update', agency_id: agency_id, id: "1"
      )
    end

    it "routes to #destroy" do
      expect(delete: "#{agency_plans_path}/1").to route_to(
        controller: "plans", action: 'destroy', agency_id: agency_id, id: "1"
      )
    end
  end
end
