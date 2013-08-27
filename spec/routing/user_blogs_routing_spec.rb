require "spec_helper"

describe UserBlogsController do
  describe "routing" do

    it "routes to #index" do
      get("/user_blogs").should route_to("user_blogs#index")
    end

    it "routes to #new" do
      get("/user_blogs/new").should route_to("user_blogs#new")
    end

    it "routes to #show" do
      get("/user_blogs/1").should route_to("user_blogs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_blogs/1/edit").should route_to("user_blogs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_blogs").should route_to("user_blogs#create")
    end

    it "routes to #update" do
      put("/user_blogs/1").should route_to("user_blogs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_blogs/1").should route_to("user_blogs#destroy", :id => "1")
    end

  end
end
