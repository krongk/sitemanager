require "spec_helper"

describe BlogItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/blog_items").should route_to("blog_items#index")
    end

    it "routes to #new" do
      get("/blog_items/new").should route_to("blog_items#new")
    end

    it "routes to #show" do
      get("/blog_items/1").should route_to("blog_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/blog_items/1/edit").should route_to("blog_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/blog_items").should route_to("blog_items#create")
    end

    it "routes to #update" do
      put("/blog_items/1").should route_to("blog_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/blog_items/1").should route_to("blog_items#destroy", :id => "1")
    end

  end
end
