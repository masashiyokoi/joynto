require "rails_helper"

RSpec.describe WarrantsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/warrants").to route_to("warrants#index")
    end

    it "routes to #new" do
      expect(get: "/warrants/new").to route_to("warrants#new")
    end

    it "routes to #show" do
      expect(get: "/warrants/1").to route_to("warrants#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/warrants/1/edit").to route_to("warrants#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/warrants").to route_to("warrants#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/warrants/1").to route_to("warrants#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/warrants/1").to route_to("warrants#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/warrants/1").to route_to("warrants#destroy", id: "1")
    end
  end
end
